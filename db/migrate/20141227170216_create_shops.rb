class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.integer :address_id
      t.string :email
      t.integer :phonenumber
      t.string :website
      t.integer :user_id
      t.timestamps
      t.boolean :active
    end
  end
end