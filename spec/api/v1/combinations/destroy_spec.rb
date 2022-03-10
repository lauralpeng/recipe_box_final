require 'rails_helper'

RSpec.describe "combinations#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/combinations/#{combination.id}"
  end

  describe 'basic destroy' do
    let!(:combination) { create(:combination) }

    it 'updates the resource' do
      expect(CombinationResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Combination.count }.by(-1)
      expect { combination.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
