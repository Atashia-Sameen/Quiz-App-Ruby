require_relative 'user'
require_relative 'teacher'
require_relative 'student'
require_relative 'get_input'
require 'pry'

def display_line
  puts "\n-------------------\n"
end

users = []
current_user = nil

# user signup prompt
def signup(users)
  puts "\nSignup as: \n"
  puts '1. Teacher', '2. Student', '3. Quit'
  choice = GetInput.call("\nChoose:  ")

  return if choice == 3

  name = GetInput.call('Enter name: ')
  password = GetInput.call('Enter password: ')

  if users.any? { |user| user.username == name }
    puts 'User already exists.'
  else
    case choice
    when 1
      users << Teacher.new(name, password)
    when 2
      users << Student.new(name, password)
    else
      puts 'Invalid Choice!'
    end
    puts "\nAccount created..!!\n"
  end
end

# user login prompt
def login(users)
  puts "\nLogin as:\n"
  puts '1. Teacher', '2. Student', '3. Quit'
  choice = GetInput.call("\nChoose:  ")

  return if choice == 3

  name = GetInput.call('Enter name: ')
  password = GetInput.call('Enter password: ')

  user = users.find { |user| user.username == name && user.password == password }
  if user.nil?
    puts 'User does not exist or wrong password.'
  else
    case user
    when Teacher
      teacher_page(user)
    when Student
      student_page(user, users)
    else
      puts 'Invalid Choice!'
    end
  end
end

# show teacher menu
def teacher_page(current_user)
  puts 'Welcome', display_line
  loop do
    puts '1. Create quiz'
    puts '2. Edit quiz'
    puts '3. View attempts'
    puts '4. Quit'
    choice = GetInput.call("\nChoose:  ")

    return if choice == 4

    case choice
    when 1
      puts "\nCreate a quiz."
      title = GetInput.call('Enter title name: ')
      current_user.create_quiz(title)
    when 2
      puts "\nEdit quiz."
      current_user.edit_quiz
    when 3
      puts "\nView attempts of quiz."
      current_user.attempts
    else
      puts 'Invalid Choice!'
    end
  end
end

# show student menu
def student_page(current_user, users)
  loop do
    puts '1. Attempt quiz'
    puts '2. View attempts'
    puts '3. View quiz of given date'
    puts '4. Quit'
    print "\nChoose: "
    choice = gets.chomp.to_i

    return if choice == 4

    case choice
    when 1
      puts "\nAttempt Quiz."
      quizzes = []

      users.each do |user|
        next unless user.is_a?(Teacher)
        # binding.pry
        user.quizzes.map do |quiz|
          quizzes << quiz if quiz.available?
        end
      end

      if quizzes
        current_user.available_quizzes(quizzes)
      else
        puts 'Quiz not available'
      end
    when 2
      current_user.view_attempts
    when 3
      puts "\nView Quiz on given time."
      given_date = GetInput.call('Enter date of quiz (DD/MM/YYYY): ')
      current_user.view_quiz(given_date)
    else
      puts 'Invalid Choice!'
    end
  end
end

loop do
  puts 'Signup/Login', display_line
  puts '1. Signup'
  puts '2. Login'
  puts '3. Quit'
  print "\nChoose: "
  choice = gets.chomp.to_i

  break if choice == 3

  case choice
  when 1
    signup(users)
  when 2
    login(users)
  else
    puts 'Invalid Choice!'
  end
end

puts "\nExiting App...!"
