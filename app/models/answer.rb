class Answer
  include DataMapper::Resource
  
  property :id, Serial
  property :body, String

  has n, :relevancies
  
  belongs_to :question
  belongs_to :user

end
