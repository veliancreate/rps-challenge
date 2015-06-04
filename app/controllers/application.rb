get '/' do
  session.clear
  GAME.reset
  erb :index
end
