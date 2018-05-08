class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :instructions, :cooktime
end
