class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[show edit update destroy]

  def index
    @q = Ingredient.ransack(params[:q])
    @ingredients = @q.result(distinct: true).includes(:combinations).page(params[:page]).per(10)
  end

  def show
    @combination = Combination.new
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit; end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      redirect_to @ingredient, notice: "Ingredient was successfully created."
    else
      render :new
    end
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to @ingredient, notice: "Ingredient was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_url,
                notice: "Ingredient was successfully destroyed."
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:ingredient_name, :have_vs_not)
  end
end
