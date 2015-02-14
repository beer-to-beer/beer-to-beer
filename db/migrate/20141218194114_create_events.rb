class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :sdate
      #t.integer :club_id
      t.references :club, index: true
      t.timestamps
    end
  end
end
