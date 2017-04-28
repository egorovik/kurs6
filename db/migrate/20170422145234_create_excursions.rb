class CreateExcursions < ActiveRecord::Migration
  def change
    create_table :excursions do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.references :city, index: true, foreign_key: true, null: false
      t.text :descr, null: false
      t.index :name, unique: true

      t.timestamps null: false
    end
  end
end
