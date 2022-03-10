class Dish < ApplicationRecord
  mount_base64_uploader :dish_photo, DishPhotoUploader

  # Direct associations

  belongs_to :category,
             :counter_cache => true

  has_many   :combinations,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

  validates :category_id, :presence => true

  validates :user_id, :presence => true

  # Scopes

  def to_s
    dish_name
  end

end
