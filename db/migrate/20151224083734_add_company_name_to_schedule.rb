class AddCompanyNameToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :company_name, :string

  end
end
