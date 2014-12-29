class AddPriceToShopBeer < ActiveRecord::Migration
  def change
    add_column :shop_beers, :price, :double
  end
end
