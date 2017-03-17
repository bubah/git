class RenameImageFilename < ActiveRecord::Migration[5.0]
  def change
  	rename_column :projects, :image_filename, :image
  end
end
