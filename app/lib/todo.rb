
class Todo
  include DataMapper::Resource

  attr_accessor :id, :title, :body, :user, :tags
  
  property :id,          Serial # auto-increment integer key
  property :name,        String 
  property :content,     Text
  property :due_date,    DateTime
  property :created_at,  DateTime

  has n, :tags
  belongs_to :user
end     
