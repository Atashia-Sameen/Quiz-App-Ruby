require 'rspec'
require_relative '../quiz-app/teacher'
require_relative '../quiz-app/quiz'
require_relative '../quiz-app/attempt'

RSpec.describe Teacher do
  let(:teacher) { Teacher.new('teacher', 'password') }
  let(:quiz) { instance_double('Quiz', title: 'Quiz', created_by: 'teaacher') }
  let(:attempt) { instance_double('Attempt', student: 'student', score: 0, quiz: quiz, student_answer: []) }

  describe '#initialize' do
    it 'creates instance of Teacher class' do
      expect(teacher.class).to eq(described_class)
      expect(teacher.username).to eq('teacher')
      expect(teacher.quizzes).to eq([])
      expect(teacher.all_attempts).to eq([])
    end
  end

    describe '#create_quiz' do
      it 'creates a new quiz instance and push it into array' do
        allow(Quiz).to receive(:new).and_return(quiz)
        teacher.create_quiz('Quiz')

        expect(teacher.quizzes).to include(quiz)
        expect(teacher.quizzes.size).to eq(1)
      end
    end

    describe '#add_questions' do
      it 'adds question to the quizzes' do
        teacher.quizzes << quiz
        allow(quiz).to receive(:created_by).and_return('teacher')
        expect(quiz).to receive(:add_question)
        teacher.add_questions
      end
    end

    describe '#quiz_availability' do
      it 'updates quiz availability' do
        teacher.quizzes << quiz
        allow(quiz).to receive(:created_by).and_return('teacher')
        expect(quiz).to receive(:update_settings)
        teacher.quiz_availability
      end
    end

    describe '#edit_title' do
      it 'updates quiz title on given index' do
        teacher.quizzes << quiz
        expect(quiz).to receive(:update_title)
        teacher.edit_title(0)
      end
    end

    describe '#edit_lock' do
      it 'updates quiz lock on given index' do
        teacher.quizzes << quiz
        expect(quiz).to receive(:lock!)
        teacher.edit_lock(0)
      end
    end

    describe '#edit_publish' do
      it 'updates quiz publish on given index' do
        teacher.quizzes << quiz
        expect(quiz).to receive(:publish!)
        teacher.edit_publish(0)
      end
    end

    describe '#view_attempts' do
      # it 'displays attempts of students' do
      #   attempt1 = 
      #   allow(attempt1).to receive(:any?).and_return(true)
      #   allow(attempt1).to receive(:each_with_index).and_yield(attempt1, 0)

      #   expect { teacher.view_attempts(attempt1) }.to output("1. Student: student, Score: 0/1 \n\n").to_stdout
      # end

      it 'displays no attempts found' do
        attempt1 = []
        allow(attempt1).to receive(:any?).and_return(false)

        expect { teacher.view_attempts(attempt1) }.to output("No attempts found.\n\n").to_stdout
      end
    end

    describe '#quiz_list' do
      it 'displays the list of available quizzes' do
        teacher.quizzes << quiz
        expect { teacher.quiz_list }.to output(/List of quizzes created/).to_stdout
        expect { teacher.quiz_list }.to output(/1. Quiz/).to_stdout
      end
    end
end
