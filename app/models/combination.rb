class Combination < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :dish_id, :presence => true

  # Scopes

  def to_s
    ingredient.to_s
  end

end
