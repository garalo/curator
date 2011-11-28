class Tag
  include DataMapper::Resource

  attr_accessor :id, :tag
  property :id,     Serial # auto-increment integer key
  property :tag,    String 

  belongs_to :todo

end
