require 'rails_helper'

RSpec.describe "combinations#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/combinations/#{combination.id}", params: params
  end

  describe 'basic fetch' do
    let!(:combination) { create(:combination) }

    it 'works' do
      expect(CombinationResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('combinations')
      expect(d.id).to eq(combination.id)
    end
  end
end
