class RecipesController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy, :edit, :update]

  def new
    redirect_to signin_path unless signed_in?

    @recipe = Recipe.new
    6.times { @recipe.additions.build(ingredient: Ingredient.new, quantity: "") }
    3.times { @recipe.steps.build }
  end

  def index
    @recipes = Recipe.all
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

  def correct_user
    begin
      user = User.find(user_id)
      redirect_to root_url, notice: "Wrong user." unless current_user?(user)
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url, notice: "You are trying to access an incorrect user."
    end
  end

end