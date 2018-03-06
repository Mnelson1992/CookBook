class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  def self.alphabetize
      self.order(name: :asc)
  end

  def quantity
     if !self.new_record?
       recipe_ingredient = RecipeIngredient.find_by(recipe_id: self.recipes.first.id, ingredient_id: self.id)
       recipe_ingredient.quantity
     end
  end

end
