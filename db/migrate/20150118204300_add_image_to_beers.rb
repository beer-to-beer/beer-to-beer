class AddImageToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :beerURL, :string
  end
end
