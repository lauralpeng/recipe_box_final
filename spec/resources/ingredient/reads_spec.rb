require "rails_helper"

RSpec.describe IngredientResource, type: :resource do
  describe "serialization" do
    let!(:ingredient) { create(:ingredient) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(ingredient.id)
      expect(data.jsonapi_type).to eq("ingredients")
    end
  end

  describe "filtering" do
    let!(:ingredient1) { create(:ingredient) }
    let!(:ingredient2) { create(:ingredient) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: ingredient2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([ingredient2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:ingredient1) { create(:ingredient) }
      let!(:ingredient2) { create(:ingredient) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      ingredient1.id,
                                      ingredient2.id,
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
                                      ingredient2.id,
                                      ingredient1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
