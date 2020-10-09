class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.integer :type_id

      t.integer :top_seats
      t.integer :bottom_seats

      t.belongs_to :train, index: true

      t.timestamps null: false
    end
  end
end
