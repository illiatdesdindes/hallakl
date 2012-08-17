class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :shopname
      t.string :description
      t.text :adress
      t.text :info
      t.references :user

      t.timestamps
    end
    add_index :shops, :user_id
    add_index :shops, :shopname, unique: true
  end
end
