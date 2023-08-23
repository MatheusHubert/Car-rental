class AddColumnToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :description, :string
    add_column :cars, :adress, :string
  end
end
