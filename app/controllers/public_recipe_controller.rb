class PublicRecipeController < ApplicationController
  def index
    @recipes = Recipe.where(public: true)
  end
end
