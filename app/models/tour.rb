class Tour < ActiveRecord::Base
  belongs_to :route
  accepts_nested_attributes_for :route
  
  validates :start_date, presence: true
  validates :days_in_tour, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :route, presence: true
  validates :add_price, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :add_descr, presence: true
end
