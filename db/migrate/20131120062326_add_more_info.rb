class AddMoreInfo < ActiveRecord::Migration
  def self.up
    add_column("schedules", "sales", :string)
    add_column("schedules", "location", :string)
  end

  def self.down
    drop_table :schedules
  end
end
