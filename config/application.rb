require 'rubygems'
require 'pakyow'
require 'data_mapper'
require 'pakyow-auth'
require 'app/lib/todo'
require 'app/lib/tag'
require 'app/lib/user'
require 'dm-migrations'

module PakyowApplication
  class Application < Pakyow::Application

  def initialize
    super
    DataMapper.finalize
  end 
    config.app.default_environment = :development
  
    configure(:development) do
      DataMapper.setup(:default, 'sqlite:///c:/Users/nate/curator/test.sqlite')
      DataMapper::Logger.new($stdout, :debug)
      DataMapper.auto_upgrade!
      app.log = true
      #app.dev_mode = true
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
