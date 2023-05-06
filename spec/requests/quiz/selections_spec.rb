require 'rails_helper'

RSpec.describe Quiz::SelectionsController, type: :request do
  describe "GET /quiz/selection" do
    context "when user is logged in" do
      let(:user) { create(:user) }
      let!(:categories) { create_list(:category, 3) }
      let!(:difficulties) { create_list(:difficulty, 3) }

      before do
        get quiz_selection_path(as: user)
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
      before { get quiz_selection_path }

      it "redirects to login page" do
        expect(response).to redirect_to sign_in_path
      end
    end
  end
end
