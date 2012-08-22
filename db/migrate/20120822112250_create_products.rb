class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price, precision: 8, scale: 2
      t.references :shop

      t.timestamps
    end
    add_index :products, :shop_id
  end
end
