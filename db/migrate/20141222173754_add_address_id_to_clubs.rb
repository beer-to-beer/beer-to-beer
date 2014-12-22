class AddAddressIdToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :address_id, :integer
  end
end
