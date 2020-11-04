class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :address
      t.integer :price
      t.integer :sqft
      t.string :image
      t.integer :rating
      t.text :notes
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
