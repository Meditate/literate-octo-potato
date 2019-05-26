require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    subject(:user) { described_class.new(params) }

    context "with not unique :api_key" do
      let!(:duplicated_user) { create(:user) }
      let(:params) { { api_key: duplicated_user.api_key } }

      it "raises NotUnique error" do
        expect { user.create! }.to raise_error { ActiveRecord::RecordInvalid }
      end
    end
  end
end
