class Api::V1::IngredientsController < Api::V1::GraphitiController
  def index
    ingredients = IngredientResource.all(params)
    respond_with(ingredients)
  end

  def show
    ingredient = IngredientResource.find(params)
    respond_with(ingredient)
  end

  def create
    ingredient = IngredientResource.build(params)

    if ingredient.save
      render jsonapi: ingredient, status: 201
    else
      render jsonapi_errors: ingredient
    end
  end

  def update
    ingredient = IngredientResource.find(params)

    if ingredient.update_attributes
      render jsonapi: ingredient
    else
      render jsonapi_errors: ingredient
    end
  end

  def destroy
    ingredient = IngredientResource.find(params)

    if ingredient.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: ingredient
    end
  end
end
