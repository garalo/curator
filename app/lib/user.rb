require 'pakyow-auth'
require 'data_mapper'

module Pakyow
  module Auth
    class User
      include DataMapper::Resource
      attr_accessor :todos, :todo
      has n, :todos
    end
  end
end
