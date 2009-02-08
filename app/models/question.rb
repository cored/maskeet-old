class Question
  include DataMapper::Resource
  
  property :id, Serial
  property :title, String
  property :body, String

  has n, :answers
  has n, :interests
  has n, :users, :through => :interests

  belongs_to :user

end
