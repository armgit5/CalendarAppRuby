class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.integer :user_id
      t.integer :schedule_id
      t.text :data
      t.text :nil_sig
      t.text :cus_sig
      t.timestamps
    end
  end
end
