class Addition < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient, autosave: true
  validates :quantity, presence: true

  accepts_nested_attributes_for :ingredient, :reject_if => lambda { |a| a[:name].blank? }

  def ingredient_name
    ingredient.name if ingredient
  end

  def ingredient_name=(name)
    self.ingredient = Ingredient.find_or_create_by(name: name) unless name.blank?
  end


end
