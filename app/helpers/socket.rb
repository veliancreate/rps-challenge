require 'faye/websocket'
require 'json'

module Sockets
  class Socket
    KEEPALIVE_TIME = 15 # in seconds

    def initialize(app)
      @app     = app
      @clients = []
    end

    def call(env)
      if Faye::WebSocket.websocket?(env)
        ws = Faye::WebSocket.new(env, nil, ping: KEEPALIVE_TIME)
        ws.on :open do |_event|
          p [:open, ws.object_id]
          @clients << ws
        end

        ws.on :message do |event|
          p [:message, event.data]
          game_on = { message: GAME.game_on?.to_s }.to_json
          ready = { message: GAME.ready?.to_s }.to_json
          quit = { message: 'quit' }.to_json
          if event.data == 'made move'
            @clients.each { |client| client.send(ready) }
          elsif event.data == 'quit'
            @clients.each { |client| client.send(quit) }
          else
            @clients.each { |client| client.send(game_on) }
          end
        end

        ws.on :close do |event|
          p [:close, ws.object_id, event.code, event.reason]
          @clients.delete(ws)
          ws = nil
        end
        ws.rack_response
      else
        @app.call(env)
      end
    end

    private

    def sanitize(message)
      json = JSON.parse(message)
      json.each { |key, value| json[key] = ERB::Util.html_escape(value) }
      JSON.generate(json)
    end
  end
end
