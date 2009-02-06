class Answer
  include DataMapper::Resource
  
  property :id, Serial
  property :body, String

  has n, :relevancy
  
  belongs_to :question
  belongs_to :user

end
