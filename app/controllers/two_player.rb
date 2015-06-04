get '/two_player' do
  @action = 'two_player'
  new_player = Player.new
  GAME.assign_player(new_player)
  session[:player_id] = new_player.object_id
  erb :name
end

post '/two_player/name' do
  player.name = params[:name]
  redirect 'two_player/game'
end

get '/two_player/game' do
  erb :two_player
end

post '/two_player/game' do
  player.selection = session[:selection]
  erb :two_player
end