require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    subject { create(:user) }

    it { is_expected.to validate_presence_of(:api_key) }
    it { is_expected.to validate_uniqueness_of(:api_key) }
  end
end
