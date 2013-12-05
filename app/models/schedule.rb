class Schedule < ActiveRecord::Base
  
  belongs_to :company
  belongs_to :location
  belongs_to :sale
  
  attr_accessible :sale_id, :company_id, :location_id, :project, :date
  def self.search(search)
    if search
      joins(:company, :sale, :location).where('lower(companies.name) LIKE lower(?) OR lower(sales.name) LIKE lower(?) OR 
        lower(locations.name) LIKE lower(?) OR lower(project) LIKE lower(?)', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end

end
