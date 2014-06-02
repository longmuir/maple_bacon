class Recipe < ActiveRecord::Base
  has_many :additions, :dependent => :destroy
  has_many :ingredients, through: :additions
  has_many :contributions
  has_many :users, through: :contributions
  has_many :steps, :dependent => :destroy

  has_attached_file :picture, :styles => { :small => "200x133#",
                                           :medium => "300x200#", 
                                           :thumb => "100x100#"}
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :picture, :less_than => 1.megabytes

  validates :title, presence: true

  accepts_nested_attributes_for :additions, :allow_destroy => true, :reject_if => lambda { |a| a[:quantity].blank? }
  accepts_nested_attributes_for :steps, :allow_destroy => true, :reject_if => lambda { |a| a[:content].blank? }

end
