class Answers < Application

  def index
    render
  end

  def recent(page = 1)
    @answers = Answer.recent_pager(page)
    display @answers
  end 

  def new
    return "" unless params[:body]
    question = Question.first(:id => params[:question_id])
    raise NotFound unless question
    user = session.user ? session.user : 'anonymous'

    @answer = Answer.new
    @answer.question = question
    @answer.body = params[:body]
    @answer.user = user
    @answer.save

    display @answer, :layout => false
  end 
  
end
