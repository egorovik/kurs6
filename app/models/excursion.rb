class Excursion < ActiveRecord::Base
  belongs_to :city
  
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :city, presence: true
  validates :descr, presence: true
end
