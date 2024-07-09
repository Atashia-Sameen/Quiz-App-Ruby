# module gets input from user and returns the input
module GetInput
  def self.call(str)
    print str
    gets.chomp
  end
end
