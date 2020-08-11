# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Ingredient.delete_all
Recipe.delete_all
Allergy.delete_all
RecipeIngredient.delete_all

def seed_unique_ingredients
    ingredients = []

    100.times do
        ingredients << Faker::Food.ingredient
    end

    ingredients = ingredients.uniq

    while ingredients.count < 100
        ingredients << Faker::Food.ingredient
        ingredients = ingredients.uniq
    end

    ingredients.each do |ingredient|
        Ingredient.create(name: ingredient, measure: Faker::Food.measurement)
    end
end

def seed_users_with_allergies
    20.times do
        user = User.create(name: Faker::Name.name)

        (2..10).to_a.sample.times do
            user.ingredients << Ingredient.all.sample
        end

        user.ingredients = user.ingredients.uniq
    end
end

def seed_unique_recipes
    recipes = []

    20.times do
        recipes << Faker::Food.dish
    end

    recipes = recipes.uniq

    while recipes.count < 20
        recipes << Faker::Food.dish
        recipes = recipes.uniq
    end

    User.all.each_with_index do |user, index|
        Recipe.create(name: recipes[index], user_id: user.id)
    end
    
end #creates 20 recipes, one for each user

def associate_ingredients_to_recipes
    Recipe.all.each do |recipe|
        5.times do
            recipe.ingredients << Ingredient.all.sample
        end
    
        recipe.ingredients = recipe.ingredients.uniq
    
        while recipe.ingredients.count < 5
            recipe.ingredients << Ingredient.all.sample
            recipe.ingredients = recipe.ingredients.uniq
        end
    end
end



seed_unique_ingredients
seed_users_with_allergies
seed_unique_recipes
associate_ingredients_to_recipes







