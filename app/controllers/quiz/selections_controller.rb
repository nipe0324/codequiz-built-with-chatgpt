module Quiz
  class SelectionsController < ApplicationController
    before_action :require_login

    def show
      @categories = Category.order(:id)
      @difficulties = Difficulty.order(:id)
    end

    def create
    end
  end
end
