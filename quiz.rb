require_relative 'question'
require 'time'
class Quiz
  attr_accessor :title, :questions, :published, :locked, :created_by, :date_created, :deadline

  def initialize(title, created_by)
    @title = title
    @created_by = created_by
    @questions = []
    @published = true
    @locked = false
    time = Time.new
    @date_created = time.strftime("%d/%m/%Y")
    @deadline = time + 1 * 24 * 60 * 60
  end

  def add
    add_question
  end

  def edit
    update_quiz
  end

  def publish!
    @published = true
  end

  def lock!
    @locked = true
  end

  def available?
    # @locked && @published && (Time.now.strftime("%d/%m/%Y") < @deadline)
    !@locked && @published
  end

  private

  def add_options
    Array.new(3) do |i|
      print "Option #{i + 1}: "
      gets.chomp
    end
  end

  def add_question
    add_availability
    loop do
      choice = GetInput.call('Do you want to add questions to the quiz? (y/n) ').downcase

      return if choice == 'n'

      text = GetInput.call('Question: ')
      options = add_options
      answer = GetInput.call('Correct option: ')
      question = Question.new(text, options, answer)
      @questions << question
      puts "\nQuestion added successfully!\n"
    end
  end

  def add_availability
    choice = GetInput.call('Do you want to lock the quiz? (y\n) ').downcase
    lock! if choice == 'y'
    choice = GetInput.call('Is quiz published? (y\n) ').downcase
    publish! if choice == 'y'
  end

  def update_quiz
    @title = GetInput.call('New title: ')
    add_availability
  end
end
