class RecipeIngredient < ApplicationRecord
  belongs_to :recipe, required: false
  belongs_to :ingredient, required: false

  def name=(name)

    ingredient = Ingredient.find_or_create_by(name: name)
    self.ingredient = ingredient
  end

  def name
    self.ingredient.name if self.ingredient
  end

  def self.alphabetize
      self.order(name: :asc)
  end

end
