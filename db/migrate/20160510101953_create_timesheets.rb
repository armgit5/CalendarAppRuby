class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.integer :user_id
      t.integer :schedule_id
      t.string :timesheet_data

      t.timestamps
    end
  end
end
