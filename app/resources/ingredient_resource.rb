class IngredientResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :ingredient_name, :string
  attribute :have_vs_not, :boolean

  # Direct associations

  has_many :combinations

  # Indirect associations
end
