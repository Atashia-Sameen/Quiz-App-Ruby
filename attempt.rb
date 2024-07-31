class Attempt
  attr_accessor :score, :student, :quiz, :student_answer

  def initialize(username, quiz)
    @student = username
    @quiz = quiz
    @score = 0
    @student_answer = []
  end

  def store_answer(index, answer)
    @student_answer[index] = answer
  end

  def calculate_score
    @quiz.questions.each_with_index do |question, q_index|
      @score += 1 if @student_answer[q_index].to_i == question.answer.to_i
    end
    @score
  end
end
