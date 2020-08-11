class Ingredient < ApplicationRecord
    has_many :allergies
    has_many :users, through: :allergies
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients
end
