class Excursion < ActiveRecord::Base
  belongs_to :city
  
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 1}
  validates :city, presence: true
  validates :descr, presence: true
end
