class UserChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :difficulty

  validates :total_quizzes,   presence: true
  validates :correct_quizzes, presence: true
  validates :current_quizzes, presence: true
  validate :correct_quizzes_less_than_or_equal_to_total_quizzes
  validate :current_quizzes_less_than_or_equal_to_total_quizzes

  private

  def correct_quizzes_less_than_or_equal_to_total_quizzes
    if correct_quizzes.present? && total_quizzes.present? && correct_quizzes > total_quizzes
      errors.add(:correct_quizzes, "must be less than or equal to total_quizzes")
    end
  end

  def current_quizzes_less_than_or_equal_to_total_quizzes
    if current_quizzes.present? && total_quizzes.present? && current_quizzes > total_quizzes
      errors.add(:current_quizzes, "must be less than or equal to total_quizzes")
    end
  end
end
