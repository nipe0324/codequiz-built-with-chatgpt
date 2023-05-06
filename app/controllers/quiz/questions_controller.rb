module Quiz
  class QuestionsController < ApplicationController
    before_action :require_login

    def show
      @user_challenge = current_user.user_challenges.find(params[:challenge_id])
      @question = @user_challenge.select_question
    end
  end
end
