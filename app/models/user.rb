# This is a default user class used to activate merb-auth.  Feel free to change from a User to 
# Some other class, or to remove it altogether.  If removed, merb-auth may not work by default.
#
# Don't forget that by default the salted_user mixin is used from merb-more
# You'll need to setup your db as per the salted_user mixin, and you'll need
# To use :password, and :password_confirmation when creating a user
#
# see merb/merb-auth/setup.rb to see how to disable the salted_user mixin
# 
# You will need to setup your database and create a user.
class User
  
  include DataMapper::Resource
  
  # properties
  
  property :id,         Serial
  
  property :login,      String
  property :first_name, String
  property :last_name,  String
  property :email,      String

  timestamps :at

  # associations

  has n, :questions
  has n, :answers
  has n, :relevancies
  has n, :interests
  has n, :questions, :through => :interests
   
  def to_s
    "#{self.first_name} #{self.last_name}"
  end 

  def is_interested_in(question)
    interest = Interest.new
    interest.question = question
    interest.user = self
    interest.save
  end 

end
