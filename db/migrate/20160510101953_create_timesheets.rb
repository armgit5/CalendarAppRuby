class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.string :job_num
      t.date :date
      t.string :customer
      t.string :engineers
      t.string :machine_type
      t.string :machine_no
      t.string :departure
      t.string :arrival
      t.integer :kilometers

      t.timestamps
    end
  end
end
