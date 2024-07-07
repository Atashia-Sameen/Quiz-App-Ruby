require_relative 'user'

class Student < User
  def initialize(username, password)
    super(username, password)
  end
  
  def attempt_quiz
    puts "\n-------Attempt Quiz-------\n\n"
  end
  
  def view_quiz
    puts "\n-------View Quiz-------\n\n"
  end

  def view_attempts
    puts "\n-------View Attempts-------\n\n"
  end
  
end
