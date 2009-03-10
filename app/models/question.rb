class Question
  
  include DataMapper::Resource
  
  # properties
  property :id,    Serial
  property :title, String, :nullable => false, :length => (1..255)
  property :stripped_title, String
  property :interested_users, Integer, :default => 0
  property :body,  Text

  timestamps :at

  # associations
  
  belongs_to :user

  has n, :answers
  has n, :interests
  has n, :users, :through => :interests

  # helper methods
  def strip_text(text)
    text.downcase.gsub(/\W/,' ').gsub(/\s+/,'-').gsub(/\-$|^\-/,'')
  end 

  #hooks
  before :save, :save_stripped_title

  def save_stripped_title
    self.stripped_title = strip_text(self.title)
  end 

end
