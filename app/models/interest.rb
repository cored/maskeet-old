class Interest
  include DataMapper::Resource
  
  property :id, Serial

  belongs_to :question
  belongs_to :user

end
