require "rails_helper"

RSpec.describe CombinationResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "combinations",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CombinationResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Combination.count }.by(1)
    end
  end

  describe "updating" do
    let!(:combination) { create(:combination) }

    let(:payload) do
      {
        data: {
          id: combination.id.to_s,
          type: "combinations",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CombinationResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { combination.reload.updated_at }
      # .and change { combination.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:combination) { create(:combination) }

    let(:instance) do
      CombinationResource.find(id: combination.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Combination.count }.by(-1)
    end
  end
end
