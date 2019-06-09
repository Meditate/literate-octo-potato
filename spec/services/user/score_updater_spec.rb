require "rails_helper"

RSpec.describe User::ScoreUpdater do
  let!(:score) { create(:score, user: user, game: game) }
  let(:game) { create(:game) }
  let!(:user) { create(:user) }
  let!(:frame) { create(:frame, user: user, game: game) }
  let(:throw_object) { create(:throw, score: 1, frame: frame) }

  let(:updater) { described_class.new(user, game, throw_object) }

  describe "#call" do
    subject { updater.call }

    context "when first throw in sequence" do
      let(:sequence) { create(:sequence, frame: frame, number_of_throws: 2, status: 0) }

      it "creates sequence throw" do
        expect { subject }.to change { sequence.sequences_throws.count }.by(1)
      end

      it "doesn't updates sequence number_of_throws" do
        expect { subject }.to_not change { sequence.number_of_throws }
      end

      it "doesn't complete sequence" do
        expect { subject }.to_not change { sequence.status }
      end
    end

    context "when it is last throw in sequence" do
      let(:sequence) { create(:sequence, frame: frame, number_of_throws: 2) }

      before do
        create(:sequences_throw, sequence: sequence, throw: throw_object )
      end

      it "creates sequence throw" do
        expect { subject }.to change { sequence.sequences_throws.count }.by(1)
      end

      it "doesn't update sequence number_of_throws" do
        expect { subject }.to_not change { sequence.number_of_throws }
      end

      it "completes sequence" do
        subject

        sequence.reload
        frame.reload
        score.reload

        expect(sequence.finished?).to be_truthy
        expect(frame.finished?).to be_truthy
        expect(score.value).to eq sequence.score
      end
    end
  end
end
