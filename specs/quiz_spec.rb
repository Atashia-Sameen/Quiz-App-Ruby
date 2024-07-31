require 'rspec'
require 'time'
require_relative '../quiz-app/quiz'
require_relative '../quiz-app/question'
require_relative '../quiz-app/get_input'

RSpec.describe Quiz do
  let!(:quiz) { described_class.new('Quiz title', 'teacher') }

  describe '#initialize' do
    it 'creates instance of Quiz class and sets attributes' do
      expect(quiz.class).to eq(described_class)
      expect(quiz.title).to eq('Quiz title')
      expect(quiz.created_by).to eq('teacher')
      expect(quiz.questions).to eq([])
      expect(quiz.published).to be true
      expect(quiz.locked).to be false
      expect(quiz.date_created).to eq(Time.now.strftime('%d/%m/%Y'))
      expect(quiz.deadline).to be_within(1).of(Time.now + 1 * 24 * 60 * 60)
    end
  end

  describe '#title' do
    it 'returns quiz title' do
      expect(quiz.title).to eq('Quiz title')
    end
  end

  describe '#questions' do
    it 'returns questions array' do
      expect(quiz.questions).to eq([])
    end
  end

  describe '#published' do
    it 'returns publish boolean' do
      quiz.published = true
      expect(quiz.published).to be(true)
    end
  end

  describe '#locked' do
    it 'returns locked boolean' do
      quiz.locked = false
      expect(quiz.locked).to be(false)
    end
  end

  describe '#created_by' do
    it 'returns creater user name' do
      expect(quiz.created_by).to eq('teacher')
    end
  end

  describe '#date_created' do
    it 'returns quiz created date' do
      time = Time.now.strftime('%d/%m/%Y')
      quiz.date_created = time
      expect(quiz.date_created).to eq(time)
    end
  end

  describe '#deadline' do
    it 'returns quiz deadline' do
      quiz.deadline = '12/08/2024'
      expect(quiz.deadline).to eq('12/08/2024')
    end
  end

  describe '#add_question' do
    let(:question) { instance_double(Question) }

    it 'adds question to questions array' do
      question1 = Question.new
      question1.text = 'What is 2 + 2'
      question1.options = %w[2 4 5]
      question1.answer = '2'

      expect(quiz.questions.size).to eq(0)

      allow(Question).to receive(:new).and_return(question)
      allow(question).to receive(:add).and_return(question1)

      quiz.add_question

      expect(quiz.questions.size).to eq(1)
      question = quiz.questions.first

      expect(question).to eql(question1)
    end
  end

  describe '#update_title' do
    it 'updates title' do
      quiz.title = 'Quiz title'
      expect(quiz.title).to eq('Quiz title')
    end
  end

  describe '#update_settings' do
    it 'updates lock and publish' do
      
    end
  end

  describe '#publish!' do
    it 'sets published to true' do
      expect(quiz.published).to be(true)
    end
  end

  describe '#lock!' do
    it 'sets locked to false' do
      expect(quiz.locked).to be(false)
    end
  end

  describe '#available?' do
    it 'returns true if quiz is not locked, published and within set deadline' do
      expect(quiz.available?).to be(true)
    end

    it 'returns false if quiz is locked, published and within set deadline' do
      quiz.locked = true
      expect(quiz.available?).to be(false)
    end

    it 'returns false if quiz is not locked, but not published and within set deadline' do
      quiz.published = false
      expect(quiz.available?).to be(false)
    end

    it 'returns false if quiz is not locked, published but not within set deadline' do
      quiz.published = false
      expect(quiz.available?).to be(false)
    end
  end

  describe '#display' do
    it 'if quiz.questions are empty then displays only quiz.title' do
      quiz.title = 'Test quiz'

      expect { quiz.display }.to output("\n'#{quiz.title}':\n").to_stdout
    end

    it 'displays title and questions' do
      question = Question.new
      question.text = 'What is color of sky?'
      question.options = %w[blue red green]
      question.answer = '1'
      quiz.questions = [question]
      title_display = "\n'#{quiz.title}':\n"
      question_display = "\nQuestion 1\n#{question.text}\n"
      options_display = "  1. #{question.options[0]}\n  2. #{question.options[1]}\n  3. #{question.options[2]}\n"

      expect {
        quiz.display
      }.to output(title_display + question_display + options_display).to_stdout
    end
  end
end
