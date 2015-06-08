before '/one_player/*' do
  @action = 'one_player'
end

get '/one_player/start_game' do
  new_player = Player.new
  session[:player_id] = new_player.object_id
  GAME.player1 = new_player
  GAME.player2 = Player.new
  erb :one_player
end

post '/one_player/enter_name' do
  player.name = params[:name]
  erb :one_player
end

get '/one_player/game' do
  erb :one_player
end

post '/one_player/selections' do
  player.selection = params[:selection].to_sym
  @computer_selection = opponent.computer_selection
  erb :one_player
end

get '/one_player/reset_selections' do
  GAME.reset_selections
  redirect 'one_player/game'
end

