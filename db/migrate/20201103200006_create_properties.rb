class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :address
      t.integer :price
      t.integer :sqft
      t.integer :expenses
      t.string :image
      t.integer :score


      t.timestamps null: false
    end
  end
end
