class CreateSchedules < ActiveRecord::Migration
  def up
    create_table :schedules do |t|  
        t.string :project
        t.datetime :date
        t.string :customer
        # Add fields that let Rails automatically keep track
        # of when movies are added or modified:
        t.timestamps
      end 
  end

  def down
    drop_table :schedules
  end
 
end
