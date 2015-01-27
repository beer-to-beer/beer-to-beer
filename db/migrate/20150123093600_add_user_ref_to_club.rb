class AddUserRefToClub < ActiveRecord::Migration
  def change
    add_reference :clubs, :user
  end
end
