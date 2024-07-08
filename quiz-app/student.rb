require_relative 'user'

class Student < User
  def initialize(username, password)
    super
  end
  
  def attempt
    puts 'Attempt Quiz'
  end
  
  def view_quiz
    puts 'View Quiz'
  end

  def view_attempts
    puts 'View Attempts'
  end
  
end
