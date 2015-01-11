class CreateCriterions < ActiveRecord::Migration
  def change
    create_table :criterions do |t|
      t.integer :rating_id
      t.string :name
      t.float :value

      t.timestamps
    end
  end
end
