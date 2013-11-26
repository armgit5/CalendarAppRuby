class Schedule < ActiveRecord::Base
  attr_accessible :sales, :customer, :location, :project
  
  def self.search(search)
    if search
      where('sales LIKE ? OR project LIKE ? OR
        location LIKE ? OR customer LIKE ?', "%#{search}%", 
        "%#{search}%", "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end

end
