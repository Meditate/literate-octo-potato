require "rails_helper"

RSpec.describe Throw::Creator do
  let!(:frame) { create(:frame) }
  let(:creator) { described_class.new(params) }

  describe "#call" do
    subject { creator.call }

    context "with valid params" do
      let(:params) { attributes_for(:throw).merge(frame: frame) }

      it { is_expected.to be_truthy }
    end

    context "with not valid attributes" do
      context "not valid score attribute" do
        let(:params) { attributes_for(:throw).merge(frame: frame, score: -1) }

        it "raises validation error" do
          expect { subject }.to raise_error{ ActiveRecord }
        end
      end
    end
  end
end
