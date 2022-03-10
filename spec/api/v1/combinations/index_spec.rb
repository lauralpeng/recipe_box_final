require 'rails_helper'

RSpec.describe "combinations#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/combinations", params: params
  end

  describe 'basic fetch' do
    let!(:combination1) { create(:combination) }
    let!(:combination2) { create(:combination) }

    it 'works' do
      expect(CombinationResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['combinations'])
      expect(d.map(&:id)).to match_array([combination1.id, combination2.id])
    end
  end
end
