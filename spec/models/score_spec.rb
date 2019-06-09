require "rails_helper"

RSpec.describe Score, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:value) }
  end

  describe "#add_score" do
    let(:score) { create(:score, :with_related_data) }

    it "adds score to current value" do
      expect { score.add_score(10) }.to change { score.value }.by(10)
    end
  end
end
