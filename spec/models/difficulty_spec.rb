require 'rails_helper'

RSpec.describe Difficulty, type: :model do
  describe 'validations' do
    subject { build(:difficulty) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end
end
