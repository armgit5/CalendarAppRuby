class Schedule < ActiveRecord::Base
  attr_accessible :sales, :customer, :location, :project, :date
  
  def self.search(search)
    if search
      where('lower(sales) LIKE lower(?) OR lower(project) LIKE lower(?) OR
        lower(location) LIKE lower(?) OR lower(customer) LIKE lower(?)', "%#{search}%", 
        "%#{search}%", "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end

end
