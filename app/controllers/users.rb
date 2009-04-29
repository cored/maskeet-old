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

  def passwordrequest(email)
    unless request.post?
      render
    end
    @user = User.first(:email => email)
    if @user.valid?
      letters = ("a".."z").to_a
      password = ""
      letters.each {|letter| password << letter[rand(letter.size-1)] } 
      @user.password = password
      send_mail(MailMailer, :notify_on_event, {
        :from => 'maskeet@maskeet-project.com',
        :to => email,
        :subject => 'Maskeet password recovery'
      }, { :user => @user })
      @user.save
    else
      message[:error] = "There is no maskeet user with this email address. Please try again"
      render :passwordrequest
    end
  end 
  
end
