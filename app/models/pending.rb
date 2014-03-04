class Pending < ActiveRecord::Base
  belongs_to :company
  belongs_to :sale
  belongs_to :status
  
  attr_accessible :sale_id, :company_id, :status_id, :project, :date, :name
end
