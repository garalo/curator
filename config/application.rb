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
      post '/users' do
        self.create_user request
      end 
    end
    
    middleware do
      use Rack::Session::Cookie
    end

    def create_user(request)
      user = User.new(request.params[:user])
      if user.valid?
        user.save!
        redirect_to! '/'
      else
        presenter.use_view_path("users/new")
        layout.bind(user)
      end
      
    end
  end
end
