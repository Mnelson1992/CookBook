class Ingredient < ApplicationRecord
  has_many :recipe_ingredients, dependent: :delete_all
  has_many :recipes, through: :recipe_ingredients

  def self.alphabetize
      self.order(name: :asc)
  end

  #def quantity
  #  if !self.new_record?
  #    recipe_ingredient = RecipeIngredient.find_by(recipe_id: self.recipes.first.id, ingredient_id: self.id)
  #    recipe_ingredient.quantity
  #  end
  #end

  #def quantity_name
  #  "#{self.quantity} -- #{self.name}"
  #end


end
