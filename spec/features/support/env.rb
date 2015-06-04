ENV['RACK_ENV'] = 'test'

require './app/server'
require 'capybara'
require 'capybara/cucumber'
require 'cucumber/rspec/doubles'

Capybara.app = Sinatra::Application
