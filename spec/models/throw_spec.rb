require "rails_helper"

RSpec.describe Throw, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:score) }
    it { is_expected.to validate_presence_of(:attempt_number) }
    it { is_expected.to validate_inclusion_of(:score).in_range(1..10) }
    it { is_expected.to validate_inclusion_of(:attempt_number).in_range(1..3) }
  end
end
