class Users < Application

  def index
    render
  end

  def show(login)
    @user = User.first(:login => login)
    raise NotFound unless @user
    display @user
  end 

  def interested(id) 
    @question = Question.get(id)
    raise NotFound unless @question

    session.user.is_interested_in(@question)
    display @question, :layout => false
  end 
  
end
