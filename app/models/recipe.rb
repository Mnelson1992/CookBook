class Recipe < ApplicationRecord
  belongs_to :user, required: false
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true
  validates :instructions, presence: true
  validates :cooktime, presence: true

  def self.alphabetize
      self.order(name: :asc)
  end

  def recipe_ingredients_attributes=(recipe_ingredients_attributes)
    recipe_ingredients_attributes.values.each do |recipe_ingredients_attribute|
      if !recipe_ingredients_attribute[:name].empty?

        recipe_ingredient = RecipeIngredient.find_or_initialize_by(id: recipe_ingredients_attribute[:id])
        recipe_ingredient.ingredient
        #ingredient = Ingredient.find_or_create_by(name: recipe_ingredients_attribute[:name])
        #recipe_ingredient = self.recipe_ingredients.find_or_initialize_by(ingredient: ingredient)
        quantity = recipe_ingredient.update_attributes(recipe_ingredients_attribute)
        if !recipe_ingredient.recipe_id
          self.recipe_ingredients << recipe_ingredient
        end

      end
    end
  end



#  def ingredients_attributes=(ingredients_attributes)
#    #self.ingredients = []
#    ingredients_attributes.values.each do |ingredients_attribute|
#      if !ingredients_attribute[:name].empty?
#        new_ingredient = Ingredient.find_or_create_by(name: ingredients_attribute[:name])
#      end
#    end
#  end
end
