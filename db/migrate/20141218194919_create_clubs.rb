class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.integer :adress_id
      t.string :url
      t.string :user_id

      t.timestamps
    end
  end
end
