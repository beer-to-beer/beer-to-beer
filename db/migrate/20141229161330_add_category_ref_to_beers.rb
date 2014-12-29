class AddCategoryRefToBeers < ActiveRecord::Migration
  def change
    add_reference :beers, :category, index: true
  end
end
