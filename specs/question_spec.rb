require 'rspec'
require_relative '../quiz-app/question'

RSpec.describe Question do
  let(:question) { described_class.new }

  describe '#initialize' do
    it 'creates instance of Question class' do
      expect(question.class).to eq(described_class)
      expect(question.text).to eq(nil)
      expect(question.options).to eq([])
      expect(question.answer).to eq(nil)
    end
  end

  describe '#text' do
    before { question.text = 'Test question statement' }
    it 'returns question statement' do
      expect(question.text).to eq('Test question statement')
    end
  end

  describe '#options' do
    before { question.options = %w[1 2 3] }

    it 'returns options array' do
      expect(question.options).to eq(%w[1 2 3])
    end
  end

  describe '#answer' do
    before do
      question.answer = 1
    end

    it 'returns answer' do
      expect(question.answer).to eq(1)
    end
  end

  describe '#display' do
    it 'displays question' do
      question.text = 'What is color of sky?'
      question.options = %w[blue red green]
      expect {
        question.display
      }.to output("#{question.text}\n  1. #{question.options[0]}\n  2. #{question.options[1]}\n  3. #{question.options[2]}\n").to_stdout
    end
  end
end
