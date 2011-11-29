require 'pakyow-auth'

class User < Pakyow::Auth::User
  attr_accessor :todos, :todo
  has n, :todos
end
