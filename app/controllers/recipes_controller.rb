class RecipesController < ApplicationController

  def new
    if !signed_in?
      redirect_to signin_path
    else
      @recipe = Recipe.new
      6.times { @recipe.additions.build(ingredient: Ingredient.new, quantity: "") }
      3.times { @recipe.steps.build }
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    contribution = current_user.contributions.build(recipe: @recipe)
    if @recipe.save && contribution.save
      redirect_to @recipe
    else
      render 'new'
    end
  end 

  def show
    @recipe = Recipe.find(params[:id])
  end

private
  def recipe_params
    params.require(:recipe).permit(:title, 
                                   additions_attributes: [:id, :quantity, :ingredient_name, :_destroy], 
                                   steps_attributes: [:id, :content, :_destroy])
  end

end