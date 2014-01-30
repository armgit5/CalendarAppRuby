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

#schedules = [{ :project => 'Replacing UV tube', :date => "2013-11-29" , :company_id => "1", :sale_id => "2", :location_id => "3"}    
#  	 ]
#schedules.each do |schedule|
#  Schedule.create!(schedule)
#end  
  
#sales = [{:name => "Aek"},
#         {:name => "Pla"},
#         {:name => "Oat"}
#]
#sales.each do |sale|
#  Sale.create!(sale) 
#end


#companies = [{:name => "Thai O PP"},
#         {:name => "Salle Inc"},
#         {:name => "Imco PP"}
#]
#companies.each do |company|
#  Company.create!(company) 
#end



#locations = [{:company_id => "1", :name => "Bangkok"},
#              {:company_id => "1", :name => "BangNa"},
#              {:company_id => "2", :name => "BangPlaKong"},
#              {:company_id => "3", :name => "BangNa"}       
#]
#locations.each do |location|
#  Location.create!(location) 
#end

require 'csv'

puts "Importing types..."
CSV.foreach(Rails.root.join("csvdb/types.csv"), headers: true) do |row|
  Type.create! do |t|
    t.id = row[0]
    t.name = row[1]
  end
end

puts "Importing products..."
CSV.foreach(Rails.root.join("csvdb/products.csv"), headers: true) do |row|
  Product.create! do |p|
    p.id = row[0]
    p.type_id = row[1]
    p.name = row[2]
  end
end

puts "Importing sales..."
CSV.foreach(Rails.root.join("csvdb/sales.csv"), headers: true) do |row|
  Sale.create! do |sale|
    sale.id = row[0]
    sale.name = row[1]
  end
end

puts "Importing companies..."
CSV.foreach(Rails.root.join("csvdb/companies.csv"), headers: true) do |row|
  Company.create! do |company|
    company.id = row[0]
    company.name = row[1]
  end
end

puts "Importing locations..."
CSV.foreach(Rails.root.join("csvdb/locations.csv"), headers: true) do |row|
  Location.create! do |location|
    location.id = row[0]
    location.company_id = row[1]
    location.name = row[2]
  end
end

puts "Importing schedules..."
CSV.foreach(Rails.root.join("csvdb/schedules.csv"), headers: true) do |row|
  Schedule.create! do |schedule|
    schedule.id = row[0]
    schedule.project = row[1]
    schedule.date = row[2]
    schedule.company_id = row[3]
    schedule.sale_id = row[4]
    schedule.location_id = row[5]
  end
end

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end;nil