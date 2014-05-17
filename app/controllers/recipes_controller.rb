class RecipesController < ApplicationController

  def new
    redirect_to signin_path unless signed_in?

    @recipe = Recipe.new
    6.times { @recipe.additions.build(ingredient: Ingredient.new, quantity: "") }
    3.times { @recipe.steps.build }
  end

  def create
    redirect_to signin_path unless signed_in?

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

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    recipe = Recipe.find(params[:id]).destroy
    flash[:success] = "Recipe '#{recipe.title}' has been deleted!"
    redirect_to current_user
  end

private
  def recipe_params
    params.require(:recipe).permit(:title, 
                                   :picture,
                                   additions_attributes: [:id, :quantity, :ingredient_name, :_destroy], 
                                   steps_attributes: [:id, :content, :_destroy])
  end

end