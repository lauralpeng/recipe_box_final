json.extract! ingredient, :id, :ingredient_name, :have_vs_not, :created_at,
              :updated_at
json.url ingredient_url(ingredient, format: :json)
