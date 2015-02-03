class AddImageToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :clubURL, :string
  end
end
