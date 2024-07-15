require 'rspec'
require_relative '../quiz-app/student'
require_relative '../quiz-app/quiz'
require_relative '../quiz-app/attempt'

RSpec.describe Student do
  let(:student) { Student.new('student', 'password') }

  describe '#initialize' do
    it 'creates instance of Student class' do
      expect(student.class).to eq(described_class)
      expect(student.username).to eq('username')
      expect(student.all_attempts).to eq([])
    end
  end

  describe '#username' do
    it 'returns student username' do
      expect(student.username).to eq('student')
    end
  end

  describe '#quizzes' do
    it 'returns quizzes array' do
      expect(attempt.score).to eq(0)
    end
  end

  describe '#all_attempts' do
    it 'returns all attempts array' do
      let(:attempt) { instance_double(Attempt) }
      student.all_attempts << attempt
      expect(student.all_attempts).to eq(attempt)
    end
  end

  describe '#available_quizzes' do
    it 'sets quizzes and calls display quizzes' do
      
    end
  end

  describe '#attempt_quiz' do
    it 'stores student answer at the given index' do
      expect(attempt.student_answer[0]).to eq('1')
    end
  end
end
