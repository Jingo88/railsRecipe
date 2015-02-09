class RecipesController < ApplicationController

	# Recipe.all looks at the model, which will then locate where in the database you are looking at
	
	def index
		@recipes = Recipe.all
		respond_to do |format|
			format.html { render :index }
			format.json { render json: @recipes }
		end
	end

	def create
		@recipe = Recipe.create(recipe_params)
		
		if @recipe.save
			render json: @recipe
		else
			render status: 404, nothing: true
		end
	end

	def show
		@recipe = Recipe.find_by(id: params[:id])

    	if @recipe
    		render json: @recipe
    	else
    		render status: 404, nothing: true
    	end
	end

	def destroy
		@recipe = Recipe.find_by(id: params[:id])
		if @recipe.destroy
			render json: {}
		else
			render status: 400, nothing: true
		end
	end

	def update
		@recipe = recipe.find_by(id: params[:id])
		if @recipe.update(recipe_params)
			render json: @recipe
		else
			render status: 400, nothing: true
		end
	end

	private
	def recipe_params
		params.require(:recipe).permit(:title, :author, :content)
	end
end

