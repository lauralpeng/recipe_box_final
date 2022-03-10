require "rails_helper"

RSpec.describe CombinationResource, type: :resource do
  describe "serialization" do
    let!(:combination) { create(:combination) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(combination.id)
      expect(data.jsonapi_type).to eq("combinations")
    end
  end

  describe "filtering" do
    let!(:combination1) { create(:combination) }
    let!(:combination2) { create(:combination) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: combination2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([combination2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:combination1) { create(:combination) }
      let!(:combination2) { create(:combination) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      combination1.id,
                                      combination2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      combination2.id,
                                      combination1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
