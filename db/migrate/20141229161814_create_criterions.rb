class CreateCriterions < ActiveRecord::Migration
  def change
    create_table :criterions do |t|
      t.integer :rating_id
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
