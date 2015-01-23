class AddUserRefToClub < ActiveRecord::Migration
  def change
    add_reference :clubs, :user, index: true
  end
end
