class DosesController < ApplicationController

before_action :set_recipe, only: [:create, :destroy]

  def create
    @dose = Dose.new(dose_params)
    @dose.recipe = @recipe
    if @dose.save
      redirect_to recipe_path(@dose.recipe)
    else
      render 'recipes/show'
    end
  end

  def destroy
    dose = Dose.find(params[:id])
    dose.destroy
    redirect_to recipe_path(@recipe)
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :recipe_id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

end


