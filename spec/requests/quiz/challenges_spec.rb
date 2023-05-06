require 'rails_helper'

RSpec.describe Quiz::ChallengesController, type: :request do
  describe "GET /quiz/challenges" do
    context "when user is logged in" do
      let(:user) { create(:user) }
      let!(:categories) { create_list(:category, 3) }
      let!(:difficulties) { create_list(:difficulty, 3) }

      before do
        get new_quiz_challenge_path(as: user)
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "displays categories on the page" do
        categories.each do |category|
          expect(response.body).to include(category.name)
        end
      end

      it "displays difficulties on the page" do
        difficulties.each do |difficulty|
          expect(response.body).to include(difficulty.name)
        end
      end
    end

    context "when user is not logged in" do
      before { get new_quiz_challenge_path }

      it "redirects to login page" do
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to sign_in_path
      end
    end
  end

  describe "POST /quiz/challenges" do
    context "when user is logged in" do
      let(:user) { create(:user) }
      let(:category) { create(:category) }
      let(:difficulty) { create(:difficulty) }

      context 'with valid category and difficulty ids' do
        let(:params) { { category_id: category.id, difficulty_id: difficulty.id } }

        before { post quiz_challenges_path(as: user), params: params }

        it 'creates a user_challenge record' do
          expect(UserChallenge.count).to eq 1

          user_challenge = UserChallenge.last
          expect(user_challenge.category).to eq category
          expect(user_challenge.difficulty).to eq difficulty
          expect(user_challenge.user).to eq user
        end

        it 'redirects to quiz_challenge page' do
          user_challenge = UserChallenge.last
          expect(response).to have_http_status(:redirect)
          expect(response).to redirect_to quiz_challenge_questions_path(user_challenge)
        end
      end

      context 'with invalid category and difficulty ids' do
        let(:params) { { category_id: 999, difficulty_id: 999 } }

        before { post quiz_challenges_path(as: user), params: params }

        it 'does not create a user_challenge record' do
          expect(UserChallenge.count).to eq 0
        end

        it 'render quiz sellection page with warning message' do
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include("カテゴリー・難易度選択")
          expect(response.body).to include("カテゴリーと難易度を選択してください。")
        end
      end
    end

    context "when user is not logged in" do
      let(:category) { create(:category) }
      let(:difficulty) { create(:difficulty) }
      let(:params) { { category_id: category.id, difficulty_id: difficulty.id } }

      before { post quiz_challenges_path(params) }

      it "redirects to login page" do
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to sign_in_path
      end
    end
  end
end
