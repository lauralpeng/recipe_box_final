class CombinationResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :ingredient_id, :integer
  attribute :quantity, :float
  attribute :unit, :string
  attribute :dish_id, :integer

  # Direct associations

  belongs_to :ingredient

  belongs_to :dish

  # Indirect associations
end
