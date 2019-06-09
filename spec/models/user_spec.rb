require "rails_helper"

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  describe "validations" do
    subject { user }

    it { is_expected.to validate_presence_of(:api_key) }
    it { is_expected.to validate_uniqueness_of(:api_key) }
  end

  describe "#can_have_a_frame?" do
    subject { user.can_have_a_frame?(game) }

    context "in game with no frames" do
      let(:game) { create(:game, frames: []) }

      it "returns true" do
        expect(subject).to be_truthy
      end
    end

    context "in game with completed count of frames" do
      let(:game) { create(:game, frames_count: 1) }
      let!(:frame) { create(:frame, user: user, game: game) }


      it "returns true" do
        expect(subject).to be_falsey
      end
    end
  end
end
