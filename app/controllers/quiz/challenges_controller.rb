module Quiz
  class ChallengesController < ApplicationController
    before_action :require_login

    def new
      @categories = Category.order(:id)
      @difficulties = Difficulty.order(:id)
    end

    def create
      category = Category.find_by(id: params[:category_id])
      difficulty = Difficulty.find_by(id: params[:difficulty_id])

      if category.blank? || difficulty.blank?
        @categories = Category.order(:id)
        @difficulties = Difficulty.order(:id)

        flash.now[:notice] = "カテゴリーと難易度を選択してください。"
        render :new, status: :unprocessable_entity
      else
        user_challenge = current_user.user_challenges.build(category: category, difficulty: difficulty)
        user_challenge.start
        redirect_to quiz_challenge_questions_path(user_challenge)
      end
    end
  end
end
