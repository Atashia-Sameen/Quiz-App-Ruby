class Quiz
  attr_accessor :questions, :is_published, :is_locked
  
  def initialize
    @questions = []
    @published = false
    @is_locked = false
  end

  def add_question(question)
    @questions << question
  end

  def publish
    @is_published = true
  end

  def locked
    @is_locked = true
  end

  def quiz_available?
    (!@is_locked && @is_published) ? true : false
  end
end