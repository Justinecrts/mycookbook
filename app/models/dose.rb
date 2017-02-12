class Dose < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  validates :description, presence:true
end
