class Users < Application

  def index
    render
  end

  def show(id)
    @user = User.get(id)
    raise NotFound unless @user
    display @user
  end 
  
end
