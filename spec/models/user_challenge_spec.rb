require 'rails_helper'

RSpec.describe UserChallenge, type: :model do
  describe 'validations' do
    subject { build_stubbed(:user_challenge) }

    it { is_expected.to validate_presence_of(:total_quizzes) }
    it { is_expected.to validate_presence_of(:correct_quizzes) }
    it { is_expected.to validate_presence_of(:current_quizzes) }

    describe '#correct_quizzes_less_than_or_equal_to_total_quizzes' do
      context 'when correct_quizzes is less than or equal to total_quizzes' do
        let(:user_challenge) do
          build_stubbed(:user_challenge, total_quizzes: 10, correct_quizzes: 10)
        end

        it 'is valid' do
          expect(user_challenge).to be_valid
        end
      end

      context 'when correct_quizzes is greater than total_quizzes' do
        let(:user_challenge) do
          build_stubbed(:user_challenge, total_quizzes: 10, correct_quizzes: 11)
        end

        it 'is invalid' do
          expect(user_challenge).to be_invalid
          expect(user_challenge.errors[:correct_quizzes]).to eq ["must be less than or equal to total_quizzes"]
        end
      end
    end

    describe '#current_quizzes_less_than_or_equal_to_total_quizzes' do
      context 'when current_quizzes is less than or equal to total_quizzes' do
        let(:user_challenge) do
          build_stubbed(:user_challenge, total_quizzes: 10, current_quizzes: 10)
        end

        it 'is valid' do
          expect(user_challenge).to be_valid
        end
      end

      context 'when current_quizzes is greater than total_quizzes' do
        let(:user_challenge) do
          build_stubbed(:user_challenge, total_quizzes: 10, current_quizzes: 11)
        end

        it 'is invalid' do
          expect(user_challenge).to be_invalid
          expect(user_challenge.errors[:current_quizzes]).to eq ["must be less than or equal to total_quizzes"]
        end
      end
    end
  end

  describe '#start' do
    let(:user_challenge) { build(:user_challenge) }

    it 'creates a new user challenge' do
      expect { user_challenge.start }.to change(UserChallenge, :count).by(1)
    end

    it 'sets total_quizzes to 5, correct_quizzes to 0 and current_quizzes to 0' do
      user_challenge.start

      user_challenge.reload
      expect(user_challenge.total_quizzes).to eq 5
      expect(user_challenge.correct_quizzes).to eq 0
      expect(user_challenge.current_quizzes).to eq 0
    end
  end
end
