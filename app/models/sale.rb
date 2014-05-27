class Sale < ActiveRecord::Base
  has_many :schedules
  has_many :users 
end
