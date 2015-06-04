get '/one_player' do
  @action = 'one_player'
  player = Player.new
  computer = Player.new
  GAME.player1 = player
  GAME.player2 = computer
  session[:player_id] = player.object_id
  erb :one_player
end

post '/one_player/name' do
  player.name = params[:name]
  redirect 'one_player/game'
end

get '/one_player/game' do
  @action = 'one_player'
  erb :one_player
end

post '/one_player/game' do
  @action = 'one_player'
  player.selection = params[:selection].to_sym
  @computer_selection = GAME.player2.computer_selection
  erb :one_player
end
