class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :instructions, :cooktime
  has_many :comments
  has_many :ingredients
end
