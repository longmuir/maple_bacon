class Recipe < ActiveRecord::Base
  has_many :additions, :dependent => :destroy
  has_many :ingredients, through: :additions
  has_many :contributions
  has_many :users, through: :contributions
  has_many :steps, :dependent => :destroy

  validates :title, presence: true

  accepts_nested_attributes_for :additions, :allow_destroy => true,:reject_if => lambda { |a| a[:quantity].blank? }
  accepts_nested_attributes_for :steps, :allow_destroy => true,  :reject_if => lambda { |a| a[:content].blank? }

end
