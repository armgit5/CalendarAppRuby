class AddNewCompaniesToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :newcom, :integer
  end
end
