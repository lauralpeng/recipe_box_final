require "rails_helper"

RSpec.describe "combinations#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/combinations/#{combination.id}", payload
  end

  describe "basic update" do
    let!(:combination) { create(:combination) }

    let(:payload) do
      {
        data: {
          id: combination.id.to_s,
          type: "combinations",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CombinationResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { combination.reload.attributes }
    end
  end
end
