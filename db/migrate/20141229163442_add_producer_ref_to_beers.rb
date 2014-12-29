class AddProducerRefToBeers < ActiveRecord::Migration
  def change
    add_reference :beers, :producer, index: true
  end
end
