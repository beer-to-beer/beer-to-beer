class CreateBeerClubs < ActiveRecord::Migration
  def change
    create_table :beer_clubs do |t|
      t.references :beer, index: true
      t.references :club, index: true

      t.timestamps
    end
  end
end
