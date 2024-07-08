require_relative 'user'
require_relative 'quiz'
require_relative 'questions'

# teacher class inherited from user
class Teacher < User
  attr_accessor :quizzes

  def initialize(username, password)
    super
    @quizzes = []
  end

  def create_quiz(title)
    quiz = Quiz.new(title)
    quizzes << quiz
    quiz
  end

  def edit_quiz(title, quiz)
    quiz.title = title
  end

  def attempts
    puts "\nAll quiz attempts: "
    # @quizzes.each {|q| puts q}
  end
end
