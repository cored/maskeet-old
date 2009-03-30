class Answer
  
  include DataMapper::Resource
  
  # properties
  property :id,          Serial
  property :body,        Text,    :nullable => false
  property :html_body,   Text
  property :relevancy_up, Integer, :default => 0
  property :relevancy_down, Integer, :default => 0

  timestamps :at
  
  
  # associations
  belongs_to :user
  belongs_to :question

  has n, :relevancies

  # hooks
  before :save, :save_html_body

  def save_html_body
    require 'bluecloth'
    self.html_body = BlueCloth.new(self.body).to_html
  end 

  def relevancy_up_percent
    total = self.relevancy_up + self.relevancy_down
    total > 0 ? sprintf('%.0f', self.relevancy_up * 100 / total) : 0 
  end 

  def relevancy_down_percent
    total = self.relevancy_up + self.relevancy_down
    total > 0 ? sprintf('%.0f', self.relevancy_down * 100 / total) : 0 
  end 

  def self.recent_pager(page)
    self.all(:order => [:created_at.desc]).paginate(:page => page, :per_page => 2)
  end 

end
