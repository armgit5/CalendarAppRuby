class AddChargableToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :chargable, :integer
  end
end
