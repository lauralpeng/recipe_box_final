class Api::V1::CombinationsController < Api::V1::GraphitiController
  def index
    combinations = CombinationResource.all(params)
    respond_with(combinations)
  end

  def show
    combination = CombinationResource.find(params)
    respond_with(combination)
  end

  def create
    combination = CombinationResource.build(params)

    if combination.save
      render jsonapi: combination, status: 201
    else
      render jsonapi_errors: combination
    end
  end

  def update
    combination = CombinationResource.find(params)

    if combination.update_attributes
      render jsonapi: combination
    else
      render jsonapi_errors: combination
    end
  end

  def destroy
    combination = CombinationResource.find(params)

    if combination.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: combination
    end
  end
end
