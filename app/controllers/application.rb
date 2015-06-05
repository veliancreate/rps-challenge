get '/' do
  session.clear
  erb :game_type
end

get '/reset_game' do
  GAME.reset
  redirect '/'
end
