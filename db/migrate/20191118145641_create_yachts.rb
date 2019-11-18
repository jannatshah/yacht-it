class CreateYachts < ActiveRecord::Migration[5.2]
  def change
    create_table :yachts do |t|
      t.string :name
      t.string :location
      t.integer :capacity
      t.string :description
      t.integer :price_per_night

      t.timestamps
    end
  end
end
