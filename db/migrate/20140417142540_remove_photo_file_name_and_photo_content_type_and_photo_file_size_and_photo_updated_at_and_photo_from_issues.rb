class RemovePhotoFileNameAndPhotoContentTypeAndPhotoFileSizeAndPhotoUpdatedAtAndPhotoFromIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :photo_file_name, :string
    remove_column :issues, :photo_content_type, :string
    remove_column :issues, :photo_file_size, :integer
    remove_column :issues, :photo_updated_at, :datetime
    remove_column :issues, :photo, :string
  end
end
