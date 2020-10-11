class AddSidesSeatsToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :side_top_seats, :integer
    add_column :cars, :side_bottom_seats, :integer
    add_column :cars, :number, :integer
    add_column :cars, :type, :string
    remove_column :cars, :type_id

  end
end
