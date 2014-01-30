class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|  
        t.text :project
        t.datetime :date
        t.integer :company_id
        t.integer :sale_id
        t.integer :location_id
        # Add fields that let Rails automatically keep track
        # of when movies are added or modified:
        t.timestamps
      end 
  end
 
end
