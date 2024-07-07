class Question
  attr_accessor :question_type, :question_text, :options, :answer
  
  def initialize(question_type, question_text, options, answer)
    @question_type = question_type
    @question_text = question_text
    @options = options
    @answer = answer
  end
end