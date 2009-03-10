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

  # hooks
  before :save, :update_relevancy

  def update_relevancy
    answer = self.answer
    if self.score == 1
      answer.relevancy_up = answer.relevancy_up + 1
    else
      answer.relevancy_down = answer.relevancy_down + 1
    end
    answer.save!
  end

end
