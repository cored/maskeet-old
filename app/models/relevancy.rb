class Relevancy
  include DataMapper::Resource
  
  property :id, Serial
  property :score, Integer

  belongs_to :answer
  belongs_to :user


end
