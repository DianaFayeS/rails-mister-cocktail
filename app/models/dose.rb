class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates :cocktail_id, uniqueness: { scope: :ingredient_id }
  
  delegate :name, to: :ingredient, prefix: true
end
