require "rails_helper"

RSpec.fdescribe Frame::Creator do
  let(:creator) { described_class.new(params) }
  let!(:user) { create(:user) }
  let!(:game) { create(:game) }
  let(:params) do
    {
      user: user,
      status: 0,
      game: game
    }
  end


  describe "#call" do
    subject { creator.call }

    context "when user can have a frame" do
      before do
        allow(user).to receive(:can_have_a_frame?).with(game).and_return(true)
      end

      context "when game doesn't have a score for user yet" do
        it "successfully creates a frame" do
          expect { subject }.to change{ user.frames.count }.by(1)
        end

        it "successfully creates a score" do
          expect { subject }.to change{ game.score_for(user).count }.by(1)
        end
      end

      context "game have a score for user" do
        let!(:score) { create(:score, game: game, user: user) }

        it "successfully creates a frame" do
          expect { subject }.to change{ user.frames.count }.by(1)
        end

        it "doesn't creates a score" do
          expect { subject }.to_not change{ game.score_for(user).count }
        end
      end
    end

    context "when user can't have a new frame" do
      before do
        allow(user).to receive(:can_have_a_frame?).and_return(false)
      end

      it "raises error" do
        expect { subject }.to raise_error{ ArgumentError }
      end
    end
  end
end
