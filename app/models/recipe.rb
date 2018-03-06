class Recipe < ApplicationRecord
  belongs_to :user, required: false
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true
  validates :instructions, length: {minimum: 5}
  validates :cooktime, presence: true

  def self.alphabetize
      self.order(name: :asc)
  end


  def ingredients_attributes=(ingredients_attributes)
    self.ingredients = []
    ingredients_attributes.values.each do |ingredients_attribute|
      if !ingredients_attribute[:name].empty?
        new_ingredient = Ingredient.find_or_create_by(name: ingredients_attribute[:name])
        self.recipe_ingredients.build(ingredient_id: new_ingredient.id, quantity: ingredients_attribute[:quantity])
      end
    end
  end
end
