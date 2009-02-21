class Interest
  
  include DataMapper::Resource
  
  # properties
  
  property :user_id,     Integer, :nullable => false, :key => true
  property :question_id, Integer, :nullable => false, :key => true 

  timestamps :at

  # associations
  
  belongs_to :user
  belongs_to :question

end
