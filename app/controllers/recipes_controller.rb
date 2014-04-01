class RecipesController < ApplicationController

  def new
    if !signed_in?
      redirect_to signin_path
    else
      @recipe = Recipe.new
      6.times { @recipe.additions.build }
      3.times { @recipe.steps.build }
    end
  end

  def create
  end

private
  def recipe_params
    params.require(:recipe).permit(:title, 
                                   additions_attributes[:id, :quantity, ingredients_attributes[:id, :name]], 
                                   steps_attributes[:id, :content], 
                                   :_destroy)
  end

end