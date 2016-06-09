class AddCountryToTimesheets < ActiveRecord::Migration
  def change
    add_column :timesheets, :country, :string

  end
end
