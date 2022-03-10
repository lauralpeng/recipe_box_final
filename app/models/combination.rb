class Combination < ApplicationRecord
  # Direct associations

  belongs_to :ingredient

  belongs_to :dish,
             counter_cache: true

  # Indirect associations

  # Validations

  validates :dish_id, presence: true

  # Scopes

  def to_s
    ingredient.to_s
  end
end
