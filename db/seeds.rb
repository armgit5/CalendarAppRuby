# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#schedules = [{:project => 'Replacing UV tube', :date => '25-Nov-2013', :customer => 'Thai O PP'},
#              {:project => 'Checking leaks', :date => '12-Dec-2013', :customer => 'Imco'},
#              {:project => 'Calibrating offset', :date => '19-Jan-2014', :customer => 'Salee'},
#  	 ]

schedules = [{ :project => 'Replacing UV tube', :date => "2013-11-29" , :company_id => "1", :sale_id => "2", :location_id => "3"}    
  	 ]
schedules.each do |schedule|
  Schedule.create!(schedule)
end  
  
sales = [{:name => "Aek"},
         {:name => "Pla"},
         {:name => "Oat"}
]
sales.each do |sale|
  Sale.create!(sale) 
end


companies = [{:name => "Thai O PP"},
         {:name => "Salle Inc"},
         {:name => "Imco PP"}
]
companies.each do |company|
  Company.create!(company) 
end



locations = [{:company_id => "1", :name => "Bangkok"},
              {:company_id => "1", :name => "BangNa"},
              {:company_id => "2", :name => "BangPlaKong"},
              {:company_id => "3", :name => "BangNa"}       
]
locations.each do |location|
  Location.create!(location) 
end