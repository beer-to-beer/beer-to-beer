class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :beer_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end
end
