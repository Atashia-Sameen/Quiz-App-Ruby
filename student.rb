require_relative 'user'
require_relative 'attempt'
require_relative 'teacher'

class Student < User
  attr_accessor :username, :quizzes, :all_attempts

  def initialize(username, password)
    super
    @username = username
    @all_attempts = []
  end

  def available_quizzes(quizzes)
    @quizzes = quizzes
    display_quizzes
    index = quiz_index

    if index && attempt_quiz(@quizzes[index])
      attempt_quiz(@quizzes[index])
    else
      puts 'Invalid Choice!'
    end
  end

  def attempt_quiz(quiz)
    attempt = Attempt.new(@username, quiz)
    display_questions(quiz, attempt)
    attempt.calculate_score
    @all_attempts << attempt

    # store_attempt(quiz, attempt)

    puts "\nYour score: #{attempt.score}/#{quiz.questions.length}\n\n"
  end

  def view_attempts
    puts "\nQuiz attempts: "
    @all_attempts.each do |attempt|
      puts "Quiz: #{attempt.quiz.title}, Score: #{attempt.score}\n\n"
    end
  end

  def view_quiz(given_date)
    if @quizzes
      @quizzes.each_with_index do |q, index|
        if given_date.to_i <= q.deadline.to_i && @quizzes.available?
          puts "Avaialable quizzes: #{index + 1}. #{q.title}"
        else
          'Quiz has passed the deadlines.'
        end
      end
    else
      puts 'No quiz avaialable.'
    end
  end

  private

  def display_quizzes
    puts "\nAvailable Quizzes: "
    @quizzes.each_with_index { |q, index| puts "#{index + 1}. #{q.title}" }
  end

  def quiz_index
    index = GetInput.call('Choose the quiz you want to attempt: ').to_i
    index - 1
  end

  def display_questions(quiz, attempt)
    puts "\n'#{quiz.title}':"
    if quiz.questions
      quiz.questions.each_with_index do |question, q_index|
        puts "\nQuestion #{q_index + 1}: #{question.text}"
        question.options.each_with_index do |option, o_index|
          puts "#{o_index + 1}. #{option}"
        end
        answer = GetInput.call('Your answer (choose option number): ')
        puts answer.to_i == question.answer.to_i ? 'Correct!' : 'Incorrect!'
        attempt.store_answer(q_index, answer)
      end
    else
      puts "\nQuestions for this quiz are not available.\n"
    end
  end

  def store_attempt(quiz, attempt)
    teacher = quiz.createrd_by
    teacher.store_student_attempts(attempt)
  end
end
