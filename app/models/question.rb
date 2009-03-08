class Question
  
  include DataMapper::Resource
  
  # properties
  property :id,    Serial
  property :title, String, :nullable => false, :length => (1..255)
  property :body,  Text

  timestamps :at

  # associations
  
  belongs_to :user

  has n, :answers
  has n, :interests
  has n, :users, :through => :interests

end
