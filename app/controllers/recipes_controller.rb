class RecipesController < ApplicationController

    def index
        @recipes = Recipe.search(params[:search])
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def new
        @recipe = Recipe.new
        @users = User.all
        # @ingredients = Ingredient.all
    end

    def create
        @recipe = Recipe.create(recipe_params)
        if @recipe.valid?
            redirect_to recipe_path(@recipe)
        else
            flash[:errors] = @recipe.errors.messages
            redirect_to new_recipe_path
        end
    end

    private
    def recipe_params
        params.require(:recipe).permit(:name, :user_id, :search, ingredient_ids:[], ingredients_attributes: [:name, :measure])
    end

end



# <!-- 
# <table>

#     <% @recipes.each do |recipe| %>
#         <tr width='25'>
#             <th scope='col' align="right">
#                 <%= link_to recipe.name, recipe_path(recipe.id) %>
#             </th>
#             <td align="left">
#                 <p>By <%= link_to recipe.user.name, user_path(recipe.user.id) %></p>
#             </td>
#         </tr>
        
#     <% end %>

# </table>

# -->