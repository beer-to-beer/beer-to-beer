class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :city
      t.integer :postal_code
      t.string :street
      t.string :house_number
      t.string :country

      t.timestamps
    end
  end
end
