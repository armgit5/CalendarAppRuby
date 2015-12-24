class AddServiceFieldsToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :machine_number, :string

    add_column :schedules, :job_num, :string

  end
end
