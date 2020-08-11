## Rails Recipes Mini Project

In this project, we will be practicing object relationships in Rails. We will be building out a domain model in which a User can author a recipe. A single Recipe `belongs_to` a user. A Recipe also has many Ingredients, while a single Ingredient can be found in many Recipes. There are Ingredients that some Users may be allergic to. **Build out full CRUD functionality as well as validations for this app.**

## Deliverables

### `Recipe`

- `index`––show all recipe instances, with the ability to sort by number of ingredients. You can use a [search for this feature](http://guides.rubyonrails.org/form_helpers.html#a-generic-search-form)
- `new`––ability to create a new recipe and associate it with a particular user. You may want to look into [collection select](http://api.rubyonrails.org/v5.2.0/classes/ActionView/Helpers/FormBuilder.html#method-i-collection_select)

### `User`

- `show` page for a user. This should include all of the recipes that a user has authored.
- The ability to delete a user should also exist

### `Ingredient`

- `index` should show all ingredients, sorted by the number of users allergic to it. For example, if several users are allergic to peanut butter, it should appear higher on the list. You might want to look into [ActiveRecord Query Methods](https://guides.rubyonrails.org/active_record_querying.html)
- `show` a particular ingredient. I should be able to see all of the recipes that an ingredient appears in

### `**Bonus**`

- Add [bootstrap for styling](https://getbootstrap.com/docs/4.1/getting-started/introduction/)


### `Relationships Thinking`
- User has many recipes
- Recipe belongs to User

- Recipe has many ingredients
- Ingredient belongs to Recipe

- This is not a many to many relationship and no join table is necessary

- or maybe this is many to many since one ingredient has many recipes
    - and for a single recipe, that recipe in a way belongs to the ingredient
    - and in order to create the recipe, the user "goes through the recipe" to be associated with that ingredient


- oh, I see, so it is many to many because a user can "have many ingredients that they're allergic to."

- but maybe this association should be separate from recipe
- maybe ingredient and recipe could be a separate many to many, while user and ingredient could be its own many to many with its own join class. so the resulting relationships would be:

* User >-- Allergy --< Ingredient
* determines who's allergic to what

* Recipe >-- RecipeIngredient --< Ingredient

* User >-- UserRecipe --< Recipe

- Ian recommneded making Ingredient the join class for user and recipe:
* User >-- Ingredient --< Recipe
    - and then use validations to make sure the user isn't associated with ingredients they're allergic to
    - but you wouldn't be able to use validationso for ingredient on the user class because ingredient is a separate model

* Possibly, the relationships are like this:
 - has_many/belongs_to: 
    * user has many recipes
    * recipe belongs_to user
        - because user creates that recipe -- doesn't mean other people can't 'view' it
        
    * recipe has many ingredients
    * ingredient belongs_to recipe
        - but deliverable says ingredient can be used in other recipes, so this should be many to many:
        * recipe has many 

---
## `Final Relationship Decision`
* User --< Allergy >-- Ingredient
* determines who's allergic to what

* Recipe --< RecipeIngredient >-- Ingredient

* User --< Recipe

 - one to many, user has many recipes
 - then you can use logic to check whether or not a recipe's ingredients are in:
    * allergies = user.ingredients
        - since user gets the list through the allergy table