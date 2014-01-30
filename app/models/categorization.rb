class Categorization < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :product
end
