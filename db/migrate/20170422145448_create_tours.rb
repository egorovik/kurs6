class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.date :start_date, null: false
      t.integer :days_in_tour, null: false
      t.references :route, index: true, foreign_key: true, null: false
      t.float :add_price, null: false, scale: 2
      t.text :add_descr, null: false

      t.timestamps null: false
    end
  end
end
