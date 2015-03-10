class AddAllDaysToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :all_day, :integer
  end
end
