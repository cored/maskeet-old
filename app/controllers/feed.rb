class Feed < Application

  only_provides :xml

  def popular
    @questions = Question.all(:limit => 10, :order => [:interested_users.desc])  
    display @questions, :layout => false 
  end 

  def recent
    @questions = Question.all(:limit => 10, :order => [:created_at.desc])
    display @questions, :layout => false
  end 

  def answers
    @answers = Answer.all(:limit => 10, :order => [:created_at.desc])
    display @answers, :layout => false
  end

end
