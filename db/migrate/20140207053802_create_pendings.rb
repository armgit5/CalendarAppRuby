class CreatePendings < ActiveRecord::Migration
  def change
    create_table :pendings do |t|
      t.datetime :date
      t.integer :company_id   
      t.text :project
      t.integer :sale_id
      t.integer :status_id
      t.timestamps
    end
  end
end
