before '/two_player/*' do
  @action = 'two_player'
end

get '/two_player/start_game' do
  new_player = Player.new
  session[:player_id] = new_player.object_id
  GAME.assign_player(new_player)
  erb :two_player
end

post '/two_player/enter_name' do
  player.name = params[:name]
  redirect 'two_player/game'
end

get '/two_player/game' do
  erb :two_player
end

post '/two_player/selections' do
  player.selection = params[:selection]
  redirect 'two_player/game'
end

get '/two_player/reset_selections' do
  GAME.reset_selections
  redirect 'two_player/game'
end

get '/two_player/poll' do
  body json ready: ready?, game_on: game_on?
end
