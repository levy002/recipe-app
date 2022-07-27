json.extract! food_recipe, :id, :quantity, :recipe_id, :food_id, :created_at, :updated_at
json.url food_recipe_url(food_recipe, format: :json)
