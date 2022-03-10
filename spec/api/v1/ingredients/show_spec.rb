require "rails_helper"

RSpec.describe "ingredients#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/ingredients/#{ingredient.id}", params: params
  end

  describe "basic fetch" do
    let!(:ingredient) { create(:ingredient) }

    it "works" do
      expect(IngredientResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("ingredients")
      expect(d.id).to eq(ingredient.id)
    end
  end
end
