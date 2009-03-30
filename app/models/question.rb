class Question
  
  include DataMapper::Resource
  
  # properties
  property :id,    Serial
  property :title, String, :nullable => false, :length => (1..255)
  property :stripped_title, String
  property :interested_users, Integer, :default => 0
  property :body,  Text
  property :html_body, Text

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
  before :save, :save_html_body

  def save_stripped_title
    self.stripped_title = strip_text(self.title)
  end 

  def save_html_body
    require 'bluecloth'
    self.html_body = BlueCloth.new(self.body).to_html
  end 

  def self.homepage_pager(page = 1)
    self.all(:order => [:interested_users.desc]).paginate(:page => page, :per_page => 2)
  end 

  def self.question_from_title(title)
    self.first(:stripped_title => title)
  end 

  def self.recent_pager(page)
    self.all(:order => [:created_at.desc]).paginate(:page => page, :per_page => 2)
  end 

end
