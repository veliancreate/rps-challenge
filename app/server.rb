require 'sinatra'
require 'sinatra/partial'
require 'thin'
require 'sinatra/json'
require 'json'

require_relative 'models/game'
require_relative 'models/player'

require_relative 'controllers/application'
require_relative 'controllers/one_player'
require_relative 'controllers/two_player'

require_relative 'helpers/application.rb'
require_relative 'helpers/two_player.rb'
require_relative 'helpers/socket.rb'

enable :sessions
set :session_secret, 'super secret'
set :partial_template_engine, :erb

use Rack::MethodOverride
use Sockets::Socket

GAME = Game.new

set :root, File.dirname(__FILE__)
set :public_folder, proc { File.join(root, '..', 'public') }
