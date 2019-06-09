require "rails_helper"

RSpec.describe Throw, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:score) }
    it { is_expected.to validate_inclusion_of(:score).in_range(0..10) }
  end
end
