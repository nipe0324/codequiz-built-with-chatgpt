require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:answer) }
  end
end
