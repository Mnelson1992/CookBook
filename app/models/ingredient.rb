class Ingredient < ApplicationRecord
  has_many :recipe_ingredients, dependent: :delete_all
  has_many :recipes, through: :recipe_ingredients

  def self.alphabetize
      self.order(name: :asc)
  end

  

end
