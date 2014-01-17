class Ingredient < ActiveRecord::Base
  has_many :additions
  has_many :ingredients, through => :additions
end
