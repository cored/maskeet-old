class Answer
  
  include DataMapper::Resource
  
  # properties
  
  property :id,          Serial
  property :body,        Text,    :nullable => false
  property :relevancy_up, Integer, :default => 0
  property :relevancy_down, Integer, :default => 0

  timestamps :at
  
  
  # associations
  
  belongs_to :user
  belongs_to :question

  has n, :relevancies

  def relevancy_up_percent
    total = self.relevancy_up + self.relevancy_down
    total > 0 ? sprintf('%.0f', self.relevancy_up * 100 / total) : 0 
  end 

  def relevancy_down_percent
    total = self.relevancy_up + self.relevancy_down
    total > 0 ? sprintf('%.0f', self.relevancy_down * 100 / total) : 0 
  end 

end
