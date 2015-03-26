class Schedule < ActiveRecord::Base
  
  belongs_to :company
  belongs_to :location
  belongs_to :sale
  belongs_to :user

  has_many :categorizations
  has_many :products, through: :categorizations
  
  attr_accessible :sale_id, :company_id, :location_id, :project, :date, :name, :product_id, :user_id, :all_day
  
#  search all 
#  def self.search(search)
#    if search
#      joins(:company, :sale, :location).where('lower(companies.name) LIKE lower(?) OR lower(sales.name) LIKE lower(?) OR 
#        lower(locations.name) LIKE lower(?) OR lower(project) LIKE lower(?)#', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
#    else
#      scoped
#    end
#  end
  
  def self.search(search)
    if search 
#      sleep(1)
      joins(:sale).where('lower(sales.name) LIKE lower(?)', "%#{search}%")
    else
#      sleep(1)
      scoped
    end
  end
  
end
