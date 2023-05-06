require 'rails_helper'

RSpec.describe Quiz::QuestionsController, type: :request do
  describe "GET /quiz/challenges/:challenge_id/questions" do
    context "when logged in" do
      let!(:user) { create(:user) }
      let!(:user_challenge) { create(:user_challenge, user: user) }
      let!(:question) { create(:question, :with_choices, category: user_challenge.category, difficulty: user_challenge.difficulty) }

      before do
        get quiz_challenge_questions_path(user_challenge, as: user)
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "displays selected question on the page" do
        expect(response.body).to include question.content
        question.question_choices.each do |choice|
          expect(response.body).to include(choice.content)
        end
      end
    end

    context "when not logged in" do
      let!(:user) { create(:user) }
      let!(:user_challenge) { create(:user_challenge, user: user) }
      let!(:question) { create(:question, :with_choices, category: user_challenge.category, difficulty: user_challenge.difficulty) }

      before do
        get quiz_challenge_questions_path(user_challenge)
      end

      it "redirects to login page" do
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to sign_in_path
      end
    end
  end
end
