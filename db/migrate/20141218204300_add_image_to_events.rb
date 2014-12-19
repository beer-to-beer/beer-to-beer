class AddImageToEvents < ActiveRecord::Migration
  def change
    add_column :events, :imageURL, :string
  end
end
