class MealsController < ApplicationController
  def index
    @meals = Meal.all.order(created_at: :desc)
  end

  def new
    @meal = Meal.new
  end

  def create
    Meal.create(meal_params)
    redirect_to action: :index
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    meal = Meal.find(params[:id])
    meal.update(meal_params)
    redirect_to action: :index
  end

  def destroy
    meal = Meal.find(params[:id])
    meal.destroy
    redirect_to action: :index
  end

  private

  def meal_params
    params.require(:meal).permit(:image, :content)
  end
end
