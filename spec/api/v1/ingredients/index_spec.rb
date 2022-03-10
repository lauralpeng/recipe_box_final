require "rails_helper"

RSpec.describe "ingredients#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/ingredients", params: params
  end

  describe "basic fetch" do
    let!(:ingredient1) { create(:ingredient) }
    let!(:ingredient2) { create(:ingredient) }

    it "works" do
      expect(IngredientResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["ingredients"])
      expect(d.map(&:id)).to match_array([ingredient1.id, ingredient2.id])
    end
  end
end
