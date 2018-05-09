class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :ing_quantity

  def ing_quantity
    object.recipe_ingredients.first.quantity
  end

end
