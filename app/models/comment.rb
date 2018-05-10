class Comment < ApplicationRecord
  belongs_to :recipe, required: false
  belongs_to :user, required: false
  validates :body, presence: true

end
