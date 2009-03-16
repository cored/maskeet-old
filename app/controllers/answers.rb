class Answers < Application

  def index
    render
  end

  def recent(page = 1)
    @answers = Answer.recent_pager(page)
    display @answers
  end 
  
end
