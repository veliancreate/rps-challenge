get '/' do
  session.clear
  GAME.reset
  erb :game_type
end
