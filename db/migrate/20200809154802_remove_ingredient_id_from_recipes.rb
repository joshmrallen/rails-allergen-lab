class RemoveIngredientIdFromRecipes < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :ingredient_id, :integer
  end
end
