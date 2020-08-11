class IngredientsController < ApplicationController

    def index
        @ingredients = Ingredient.all.sort_by{|ingredient| ingredient.allergies.count }.reverse
    end

    def show
        @ingredient = Ingredient.find(params[:id])
    end


end
