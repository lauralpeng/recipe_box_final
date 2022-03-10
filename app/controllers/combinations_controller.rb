class CombinationsController < ApplicationController
  before_action :set_combination, only: %i[show edit update destroy]

  def index
    @q = Combination.ransack(params[:q])
    @combinations = @q.result(distinct: true).includes(:dish,
                                                       :ingredient).page(params[:page]).per(10)
  end

  def show; end

  def new
    @combination = Combination.new
  end

  def edit; end

  def create
    @combination = Combination.new(combination_params)

    if @combination.save
      message = "Combination was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @combination, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @combination.update(combination_params)
      redirect_to @combination, notice: "Combination was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @combination.destroy
    message = "Combination was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to combinations_url, notice: message
    end
  end

  private

  def set_combination
    @combination = Combination.find(params[:id])
  end

  def combination_params
    params.require(:combination).permit(:ingredient_id, :quantity, :unit,
                                        :dish_id)
  end
end
