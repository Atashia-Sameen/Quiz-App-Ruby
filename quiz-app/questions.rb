class Question
  attr_accessor :text, :options, :answer

  def initialize(text, options, answer)
    @text = text
    @options = options
    @answer = answer
  end
end
