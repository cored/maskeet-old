class Questions < Application
  # provides :xml, :yaml, :js

  def index
    @questions = Question.all
    display @questions
  end

  def show(id)
    @question = Question.get(id)
    raise NotFound unless @question
    display @question
  end

  def new
    only_provides :html
    @question = Question.new
    display @question
  end

  def edit(id)
    only_provides :html
    @question = Question.get(id)
    raise NotFound unless @question
    display @question
  end

  def create(question)
    @question = Question.new(question)
    if @question.save
      redirect resource(@question), :message => {:notice => "Question was successfully created"}
    else
      message[:error] = "Question failed to be created"
      render :new
    end
  end

  def update(id, question)
    @question = Question.get(id)
    raise NotFound unless @question
    if @question.update_attributes(question)
       redirect resource(@question)
    else
      display @question, :edit
    end
  end

  def destroy(id)
    @question = Question.get(id)
    raise NotFound unless @question
    if @question.destroy
      redirect resource(:questions)
    else
      raise InternalServerError
    end
  end

end # Questions
