class Quiz
  attr_accessor :questions, :published, :locked

  def initialize
    @questions = []
    @published = false
    @locked = false
  end

  def add_question(question)
    @questions << question
  end

  def publish!
    @published = true
  end

  def lock!
    @locked = true
  end

  def available?
    !@locked && @published
  end
end
