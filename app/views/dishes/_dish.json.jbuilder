json.extract! dish, :id, :dish_name, :source, :time_required, :category_id, :user_id, :dish_photo, :instructions, :created_at, :updated_at
json.url dish_url(dish, format: :json)
