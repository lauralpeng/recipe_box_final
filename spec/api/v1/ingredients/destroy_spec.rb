require 'rails_helper'

RSpec.describe "ingredients#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/ingredients/#{ingredient.id}"
  end

  describe 'basic destroy' do
    let!(:ingredient) { create(:ingredient) }

    it 'updates the resource' do
      expect(IngredientResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Ingredient.count }.by(-1)
      expect { ingredient.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
