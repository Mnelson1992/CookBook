class Recipe < ApplicationRecord
  belongs_to :user, required: false
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true
  validates :instructions, length: {minimum: 5}
  validates :cooktime, presence: true

  def self.alphabetical
      self.order(name: :asc)
  end


  def ingredients_attributes=(ingredients_attributes)
    self.ingredients = []
    ingredients_attributes.values.each do |ingredients_attribute|
      if !ingredients_attribute.empty?
        new_ingredient = Ingredient.find_or_create_by(ingredients_attribute)
        #new_ingredient.build(ingredients_attribute)
        self.ingredients << new_ingredient if !self.ingredients.include?(new_ingredient)
      end
    end
  end
end
