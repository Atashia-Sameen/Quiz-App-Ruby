require_relative 'user'
require_relative 'teacher'
require_relative 'student'

def get_input(str)
  print "#{str}"
  gets.chomp
end

def display_line
  puts "\n-------------------\n"
end

# user signup prompt
def signup(users)
  puts "\nSignup as: \n"
  puts '1. Teacher', '2. Student', '3. Quit'
  print "\nChoose: "
  choice = gets.chomp.to_i

  return if choice == 3

  name = get_input('Enter name: ')
  password = get_input('Enter password: ')

  if users.any? { |user| user.name == name }
    puts 'User already exists'
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
def login(users, current_user)
  puts "\nLogin as:\n"
  puts '1. Teacher', '2. Student', '3. Quit'
  print "\nChoose: "
  choice = gets.chomp.to_i

  return if choice == 3

  name = get_input('Enter name: ')
  password = get_input('Enter password: ')

  if users.any? { |user| user.name != name }
    puts 'User does not exists.'
  else
    case choice
    when 1
      current_user = Teacher.new(name, password)
      teacher_page(current_user)
    when 2
      current_user = Student.new(name, password)
      student_page(current_user)
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
    print "\nChoose: "
    choice = gets.chomp.to_i

    return if choice == 4

    case choice
    when 1
      puts 'Create a quiz.'
      print 'Enter topic name: '
      topic = gets.chomp.downcase
      quiz = current_user.create_quiz(topic)
      puts quiz
    when 2
      puts 'Edit quiz.'
      current_user.edit_quiz()
    when 3
      puts 'View attempts of quiz.'
      current_user.attempts
    else
      puts 'Invalid Choice!'
    end
  end
end

# show student menu
def student_page(_current_user)
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
      puts 'Attempt Quiz.'
      current_user.attempt
    when 2
      puts 'View Attempts.'
    when 3
      puts 'View Quiz on given time.'
    end
  end
end

users = []
current_user = nil

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
    login(users, current_user)
  else
    puts 'Invalid Choice!'
  end
end

puts "\nExiting App...!"
