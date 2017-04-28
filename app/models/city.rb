class City < ActiveRecord::Base
  has_many :excursions
  has_many :routes
  
  validates :name, presence: true, uniqueness: true
end
