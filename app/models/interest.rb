class Interest
  include DataMapper::Resource
  
  property :user_id, Integer, :key => true
  property :question_id, Integer, :key => true 

  belongs_to :question
  belongs_to :user

  timestamps :at

end
