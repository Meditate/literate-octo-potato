require "rails_helper"

RSpec.describe Score, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:value) }
  end
end
