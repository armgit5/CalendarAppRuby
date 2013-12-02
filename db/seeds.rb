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

schedules = [{ :project => 'Replacing UV tube', :customer => 'Thai O PP', :sales => "Pla", :location => "Bang PaKong", :date => "2013-11-29"}    
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




locations = [{:location => "Bangkok"},
         {:location => "Bang Pla Kong"},
         {:location => "Bang Na"}
]
locations.each do |location|
  Location.create!(location) 
end

companies = [{:name => "Thai O PP"},
         {:name => "Salle Inc"},
         {:name => "Imco PP"}
]
companies.each do |company|
  Company.create!(company) 
end

  
Company.find(1).locations << Location.find(1)
Company.find(1).locations << Location.find(2)
#thaiopp = Company.find(0)
#thaiopp.locations << Location.find(1)
#thaiopp.locations << Location.find(2)