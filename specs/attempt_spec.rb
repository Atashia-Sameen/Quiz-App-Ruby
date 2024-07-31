require 'rspec'
require_relative '../quiz-app/attempt'
require_relative '../quiz-app/quiz'
require_relative '../quiz-app/question'

RSpec.describe Attempt do
  let(:attempt) { described_class.new('name', 'password') }
  let(:quiz) { described_class.new('Quiz title', 'teacher') }

  describe '#initialize' do
    it 'creates instance of Attempt class' do
      expect(attempt.class).to eq(described_class)
      expect(attempt.student).to eq('username')
      expect(attempt.quiz).to eq(quiz)
      expect(attempt.score).to eq(0)
      expect(attempt.student_answer).to eq([])
    end
  end

  describe '#student' do
    it 'returns student username' do
      expect(attempt.student).to eq('student')
    end
  end

  describe '#score' do
    it 'returns student score' do
      expect(attempt.score).to eq(0)
    end
  end

  describe '#quiz' do
    it 'returns quiz array' do
      
    end
  end

  describe '#student_answer' do
    it 'returns selected student answer' do
      expect(attempt.student_answer).to eq([])
    end
  end

  describe '#store_answer' do
    it 'stores student answer at the given index' do
      expect(attempt.student_answer[0]).to eq('1')
    end
  end

  describe '#calculate_score' do
    it 'calculates score of student by checking the student answer' do
      index = 0
      attempt.store_answer(index, '1')
      attempt.store_answer(index + 1, '2')
      expect(attempt.calculate_score).to eq(1)
    end
  end
end
