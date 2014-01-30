class Type < ActiveRecord::Base
  has_many :schedules
  has_many :products
end
