class Product < ActiveRecord::Base
  has_many :categorizations
  has_many :schedules, through: :categorizations
  belongs_to :type
end
