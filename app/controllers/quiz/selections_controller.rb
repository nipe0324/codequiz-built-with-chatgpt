module Quiz
  class SelectionsController < ApplicationController
    before_action :require_login

    def show
      @categories = Category.order(:id)
      @difficulties = Difficulty.order(:id)
    end

    def create
      category = Category.find(params[:category_id])
      difficulty = Difficulty.find(params[:difficulty_id])

      user_challenge = current_user.user_challenges.build(category: category, difficulty: difficulty)
      if user_challenge.start
        redirect_to quiz_challenge_path(user_challenge)
      else
        flash.now[:error] = "予期せぬエラーが発生しました。再度やりなおしてください。"
        render :show, status: :unprocessable_entity
      end
    end
  end
end
