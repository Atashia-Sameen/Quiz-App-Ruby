class Question
  attr_accessor :text, :options, :answer

  def initialize(text, options, answer)
    @text = text
    @options = options
    @answer = answer
  end
end


q = Question.new('What is 2 + 1', %w(2 3 1), 3)
puts q