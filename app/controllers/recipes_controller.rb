class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    2.times { @recipe.ingredients.build }

  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "Your recipe was created"
    end
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:title, ingredients_attributes: [ :quantity, :name ])
  end
end
