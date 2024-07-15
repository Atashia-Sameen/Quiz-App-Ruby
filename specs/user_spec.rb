# frozen_string_literal: true

require 'rspec'
require_relative '../quiz-app/user'

RSpec.describe User do
  let(:user) { described_class.new('name', 'password') }

  describe '#initialize' do
    it 'creates instance of User class' do
      expect(user.class).to eq(described_class)
    end
  end

  describe '#name' do
    it 'returns User name' do
      expect(user.name).to eq('name')
    end
  end

  describe '#password' do
    it 'returns User password' do
      expect(user.password).to eq('password')
    end
  end
end
