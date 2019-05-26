require "rails_helper"

RSpec.describe Frame, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:status) }
  end
end
