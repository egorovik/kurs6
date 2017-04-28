class Tour < ActiveRecord::Base
  belongs_to :route
  
  validates :start_date, presence: true
  validates :days_in_tour, presence: true
  validates :route, presence: true
  validates :add_price, presence: true
  validates :add_descr, presence: true
end
