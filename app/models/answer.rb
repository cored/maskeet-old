class Answer
  
  include DataMapper::Resource
  
  # properties
  
  property :id,          Serial
  property :body,        Text,    :nullable => false

  timestamps :at
  
  
  # associations
  
  belongs_to :user
  belongs_to :question

  has n, :relevancies

end
