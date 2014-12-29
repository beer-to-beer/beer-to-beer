class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :title

      t.timestamps
    end
  end
end
