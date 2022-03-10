require "rails_helper"

RSpec.describe "ingredients#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/ingredients/#{ingredient.id}", payload
  end

  describe "basic update" do
    let!(:ingredient) { create(:ingredient) }

    let(:payload) do
      {
        data: {
          id: ingredient.id.to_s,
          type: "ingredients",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(IngredientResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { ingredient.reload.attributes }
    end
  end
end
