require 'rubygems'
require 'pakyow'
require 'data_mapper'
require 'dm-migrations'
require 'app/lib/user'
require 'pakyow-auth'


module PakyowApplication
  class Application < Pakyow::Application
    config.app.default_environment = :development
  
    configure(:development) do
      DataMapper.setup(:default, 'sqlite:///tmp/teste.sqlite')
      DataMapper::Logger.new($stdout, :debug)
      DataMapper.finalize
      DataMapper.auto_upgrade!
      app.log = true
      app.dev_mode = true
    end
    
    routes do
      default :ApplicationController, :index
      restful 'todos', :TodosController 
      Pakyow::Auth.routes
    end
    
    middleware do
      use Rack::Session::Cookie
    end
  end
end
