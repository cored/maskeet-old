class Questions < Application
  # provides :xml, :yaml, :js

  # TODO: Find a way to put the per_page value in a global variable
  def index(page = 1)
    @questions = Question.homepage_pager(page)
    display @questions
  end

  def show(stripped_title)
    @question = Question.question_from_title(stripped_title)
    raise NotFound unless @question
    display @question
  end

end # Questions
