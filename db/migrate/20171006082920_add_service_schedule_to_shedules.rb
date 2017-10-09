class AddServiceScheduleToShedules < ActiveRecord::Migration
  def change
    add_column :schedules, :service_schedule, :integer
  end
end
