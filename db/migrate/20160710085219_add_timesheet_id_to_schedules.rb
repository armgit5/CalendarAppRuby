class AddTimesheetIdToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :timesheet_id, :integer

  end
end
