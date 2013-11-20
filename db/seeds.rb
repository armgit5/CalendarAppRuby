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

schedules = [{ :project => 'Replacing UV tube', :date => '25-Nov-2013', :customer => 'Thai O PP', :sales => "Pla", :location => "Bang PaKong"}    
  	 ]

schedules.each do |schedule|
  Schedule.create!(schedule)
end