class Users < Application

  def index
    render
  end

  def show(id)
    @user = User.get(id)
    raise NotFound unless @user
    display @user
  end 

  def interested(id) 
    provides :js, :html
    @question = Question.get(id)
    raise NotFound unless @question

    #interest = Interest.new
    #interest.question = @question
    #interest.user = session.user
    #interest.save
    display @question 
  end 
  
end
