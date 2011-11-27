class Todo
  include DataMapper::Resource

  attr_accessor :id, :title, :body
  
  property :id,          Serial # auto-increment integer key
  property :name,        String 
  property :content,     Text
  property :due_date,    DateTime
  property :created_at,  DateTime

  has n, :tags
  has 1, :user
  belongs_to :user
end     
