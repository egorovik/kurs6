class Route < ActiveRecord::Base
  belongs_to :city
  has_many :tours
  
  validates :name, presence: true, uniqueness: true
  validates :base_price, presence: true
  validates :city, presence: true
  validates :descr, presence: true
end
