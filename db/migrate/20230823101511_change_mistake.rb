class ChangeMistake < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :adress, :string
    add_column :cars, :address, :string
  end
end
