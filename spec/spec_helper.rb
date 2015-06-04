ENV['RACK_ENV'] = 'test'

require './app/server'
require 'capybara'
require 'capybara/cucumber'

Capybara.app = Sinatra::Application
