require_relative 'user'
require_relative 'teacher'
require_relative 'student'

puts "\n-------Signup/Login-------\n\n"

users = []

loop do
  puts 'Signup as: '
  puts "1. Teacher \n2. Student"
  print 'Choose role (T/S or Q to quit): '
  role = gets.chomp.downcase

  break if role == 'q'

  print 'Enter Name: '
  name = gets.chomp

  print 'Enter Password: '
  password = gets.chomp

  case role
  when 't'
    puts "\nUser already exists.\nTry again..!\n\n" if users.any? { |user| user.name == name }
    users << Teacher.new(name, password)
    puts 'Teacher created..!'
  when 's'
    puts "\nUser already exists.\nTry again..!\n\n" if users.any? { |user| user.name == name }
    users << Student.new(name, password)
    puts 'Student created..!'
  else
    puts 'Invalid Choice!'
  end

  if role == 't'
    loop do
      puts '1. Create Quiz'
      puts '2. Edit Quiz'
      puts '3. View Attempts'
      print 'Select option: '
      option = gets.chomp.to_i

      case option
      when 1
        
      when 2
      when 3
      else
        puts 'Invalid Choice!'
      end
    end
  elsif role == 's'
    loop do
      puts '1. Attempt Quiz'
      puts '2. View Attempts'
      puts '3. View Quiz of date'
      print 'Select option: '
      option = gets.chomp.to_i

      case option
      when 1

      when 2

      when 3

      else
        puts 'Invalid Choice!'
      end
    end
  end
end
puts "\nExiting App...!"
