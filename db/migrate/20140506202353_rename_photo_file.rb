class RenamePhotoFile < ActiveRecord::Migration
  def change
  	rename_column(:photos, :photo, :image)
  end
end
