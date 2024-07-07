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

  print 'Enter Username: '
  username = gets.chomp

  print 'Enter Password: '
  password = gets.chomp

  case role
  when 't'
    users << Teacher.new(username, password)
    puts 'Teacher created..!'
  when 's'
    users << Student.new(username, password)
    puts 'Student created..!'
  else
    puts 'Invalid Choice!'
  end
end

puts "\nExiting App...!"
