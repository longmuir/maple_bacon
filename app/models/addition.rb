class Addition < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient, autosave: true

  accepts_nested_attributes_for :ingredient, :reject_if => lambda { |a| a[:name].blank? }


  validates :quantity, presence: true
end
