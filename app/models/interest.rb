class Interest
  
  include DataMapper::Resource
  
  # properties
  property :user_id, Integer, :key => true
  property :question_id, Integer, :key => true
  timestamps :at

  # associations
  
  belongs_to :user, :child_key => [:user_id] 
  belongs_to :question, :child_key => [:question_id]

  # hooks
  before :save, :user_interest

  def user_interest
    self.question.interested_users = self.question.interested_users + 1
    self.question.save!
  end 
end
