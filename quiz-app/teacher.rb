require_relative 'user'
require_relative 'quiz'

class Teacher < User
  attr_accessor :all_quiz

  def initialize(username, password)
    super(username, password)
    @all_quiz = []
  end

  def create_quiz(topic)
    quiz = Quiz.new(topic)
    all_quiz << quiz
    return quiz
  end

  def edit_quiz(topic, quiz)
    quiz.topic = topic
  end

  def view_attempts
    puts "\nAll quiz attempts: "
    # @all_quiz.each {|q| puts q}
  end
end


quiz = teacher.create_quiz('Ruby Basics')
q1 = Question.new('mcq', 'What is the output of 1 + 1?', ['1', '2', '3', '4'], '2')
quiz.add_question(q1)