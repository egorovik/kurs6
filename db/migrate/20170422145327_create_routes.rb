class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name, null: false
      t.integer :base_price, null: false
      t.references :city, index: true, foreign_key: true, null: false
      t.text :descr, null: false
      t.index :name, unique: true

      t.timestamps null: false
    end
  end
end
