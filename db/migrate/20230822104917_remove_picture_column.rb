class RemovePictureColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :pictures
  end
end
