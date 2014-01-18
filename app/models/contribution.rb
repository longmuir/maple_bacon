class Contribution < ActiveRecord::Base
  belongs_to :author
  belongs_to :recipe
end
