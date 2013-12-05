class Location < ActiveRecord::Base
  belongs_to :company
  has_many :schedules
end
