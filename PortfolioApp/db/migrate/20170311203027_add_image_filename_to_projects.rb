class AddImageFilenameToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :image_filename, :string
  end
end
