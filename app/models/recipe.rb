class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    # accepts_nested_attributes_for :ingredients
    validates :name, uniqueness: { message: "That Recipe already exists." }

    def ingredients_attributes=(ingredient_attributes)
        ingredient_attributes.values.each do |ingredient_attribute|
            ingredient = Ingredient.find_or_create_by(ingredient_attribute)
            self.ingredients << ingredient
        end
    end

    def self.search(search)
        if search
            ingredient = Ingredient.find_by(name: search)
            if ingredient
                self.all.select {|recipe| recipe.ingredients.include?(ingredient) }
            else
                Recipe.all
            end
        else
            Recipe.all
        end
    end
end
