class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.integer :sale_id
      t.integer :role_id
      t.timestamps
    end
  end
end
