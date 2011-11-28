class Pakyow::Auth::User
      include DataMapper::Resource
      has n, :todos
      belongs_to :todo
end
