class User 
  include Pakyow::Auth::User
  has n, :todos
end
