require "rails_helper"

RSpec.describe Game, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:key) }
    it { is_expected.to validate_numericality_of(:frames_count).is_greater_than(0) }
  end
end
