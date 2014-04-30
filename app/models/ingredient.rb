class Ingredient < ActiveRecord::Base
  has_many :additions
  has_many :recipes, through: :additions

  accepts_nested_attributes_for :additions, :reject_if => lambda { |a| a[:name].blank? }

  validates :name, presence: true, length: { maximum: 100 }, uniqueness: true
end
