require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:question) }
    it { is_expected.to validate_presence_of(:explanation) }
  end
end
