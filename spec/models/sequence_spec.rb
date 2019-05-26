require "rails_helper"

RSpec.describe Sequence, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:number_of_throws) }
    it do
      is_expected.to validate_inclusion_of(:number_of_throws).in_range(2..3)
    end
  end
end
