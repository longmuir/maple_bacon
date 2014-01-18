class Ingredient < ActiveRecord::Base
  has_many :additions
  has_many :ingredients, through: :additions

  validates :name, presence: true, length: { maximum: 100 }, uniqueness: true
end
