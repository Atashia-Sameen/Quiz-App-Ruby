class Quiz
  attr_accessor :title, :questions, :published, :locked, :createrd_by

  def initialize(title)
    @title = title
    @questions = []
    @published = false
    @locked = false
  end

  def add(question)
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
