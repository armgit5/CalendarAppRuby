class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|

      t.datetime :date
      t.string :name
      t.timestamps
   
    end
  end
end
