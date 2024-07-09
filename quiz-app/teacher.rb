require_relative 'user'
require_relative 'quiz'
require_relative 'attempt'
require_relative 'question'
require_relative 'get_input'

# teacher class inherited from user
class Teacher < User
  attr_accessor :username, :quizzes, :all_attempts

  def initialize(username, password)
    super
    @username = username
    @quizzes = []
    @all_attempts = []
  end

  def create_quiz(title)
    quiz = Quiz.new(title, username)
    quiz.add
    @quizzes << quiz
  end

  def edit_quiz
    quiz_list
    index = quiz_index
    @quizzes[index].edit
  end

  def store_attempts(attempts)
    @all_attempts << attempt
  end

  def attempts
    puts "\nAll quiz attempts by students: "
    @all_attempts.each do |attempt|
      puts "Student: #{attempt.student} attempted quiz: #{attempt.quiz.title}, Score: #{attempt.score}/#{attempt.quiz.questions.length}\n"
    end
  end

  private

  def quiz_list
    puts "\nList of quizzes created: "
    @quizzes.each_with_index { |q, index| puts "#{index + 1}. #{q.title}" }
  end

  def quiz_index
    index = GetInput.call('Choose the quiz you want to edit: ').to_i
    index - 1
  end
end
