json.extract! combination, :id, :ingredient_id, :quantity, :unit, :dish_id,
              :created_at, :updated_at
json.url combination_url(combination, format: :json)
