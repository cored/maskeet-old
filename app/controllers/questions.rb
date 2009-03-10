class Questions < Application
  # provides :xml, :yaml, :js

  def index
    @questions = Question.all
    display @questions
  end

  def show(stripped_title)
    @question = Question.first(:stripped_title => stripped_title)
    raise NotFound unless @question
    display @question
  end

end # Questions
