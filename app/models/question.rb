class Question
  include DataMapper::Resource
  
  property :id, Serial
  property :title, String
  property :body, String

  has n, :answer

  belongs_to :user

end
