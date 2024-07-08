require_relative 'user'
require_relative 'quiz'
require_relative 'questions'

class Teacher < User
  attr_accessor :quizzes

  def initialize(username, password)
    super
    @quizzes = []
  end

  def create(topic)
    quiz = Quiz.new(topic)
    quizzes << quiz
    quiz
  end

  def edit(topic, quiz)
    quiz.topic = topic
  end

  def attempts
    puts "\nAll quiz attempts: "
    # @quizzes.each {|q| puts q}
  end
end
