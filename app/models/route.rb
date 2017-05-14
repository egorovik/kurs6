class Route < ActiveRecord::Base
  belongs_to :city
  has_many :tours
  accepts_nested_attributes_for :city
  
  validates :name, presence: true, uniqueness: true
  validates :base_price, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :city, presence: true
  validates :descr, presence: true
end
