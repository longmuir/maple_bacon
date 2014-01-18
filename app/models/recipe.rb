class Recipe < ActiveRecord::Base
  has_many :additions
  has_many :recipes, through: :additions
  has_many :contributions
  has_many :users, through: :contributions

  validates :title, presence: true

end
