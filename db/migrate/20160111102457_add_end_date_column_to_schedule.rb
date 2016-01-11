class AddEndDateColumnToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :end_date, :datetime

  end
end
