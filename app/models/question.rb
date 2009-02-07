class Question
  include DataMapper::Resource
  
  property :id, Serial
  property :title, String
  property :body, String

  has n, :answers

  belongs_to :user

end
