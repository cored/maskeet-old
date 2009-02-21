class Relevancy
  
  include DataMapper::Resource
  
  # properties
  
  property :id,        Serial
  
  property :user_id,   Integer, :nullable => false
  property :answer_id, Integer, :nullable => false
  
  property :score,     Integer

  timestamps :at

  # associations
  
  belongs_to :user
  belongs_to :answer

end
