class RecipesController < ApplicationController
    before_action :authorize

    def index
       recipes = Recipe.all
       render json: recipes, status: :ok 
    end

    private

    def authorize
        return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    end
end
