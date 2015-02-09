class RecipesController < ApplicationController

	# Recipe.all looks at the model, which will then locate where in the database you are looking at
	
	def index
		@recipes = Recipe.all
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.create(recipe_params)
		redirect_to @entry
	end

	def show
		@recipe = Recipe.find_by(id: params[:id])

		@user = User.find_by(id: session[:user_id])

    	if @user
    		render :show
    	else
    		redirect_to '/login'
    	end
	end

	def destroy
		@recipe = Recipe.find_by(id: params[:id])
		@recipe.destroy

		redirect_to recipes_path
	end

	def edit
		@recipe = Recipe.find_by(id: params[:id])
	end

	def update
		@recipe = recipe.find_by(id: params[:id])
		@recipe.update_attributes(recipe_params)

		redirect_to @recipe
	end

	private
	def recipe_params
		params.require(:recipe).permit(:title, :author, :content)
	end
end

