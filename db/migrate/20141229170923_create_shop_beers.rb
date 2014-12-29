class CreateShopBeers < ActiveRecord::Migration
  def change
    create_table :shop_beers do |t|
      t.references :shop, index: true
      t.references :beer, index: true

      t.timestamps
    end
  end
end
