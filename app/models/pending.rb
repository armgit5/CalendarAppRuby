class Pending < ActiveRecord::Base
  belongs_to :company
  belongs_to :sale
  belongs_to :status
  mount_uploader :pdf, PdfUploader
  
  attr_accessible :sale_id, :company_id, :status_id, :project, :date, :name, :pdf
end
