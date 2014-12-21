class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :sdate
      t.integer :club_id
      t.timestamps
    end
  end
end
