class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.timestamps
    end
    
    create_table :locations do |t|
      t.belongs_to :company
      t.datetime :order_date
      t.timestamps
    end
  end
end
