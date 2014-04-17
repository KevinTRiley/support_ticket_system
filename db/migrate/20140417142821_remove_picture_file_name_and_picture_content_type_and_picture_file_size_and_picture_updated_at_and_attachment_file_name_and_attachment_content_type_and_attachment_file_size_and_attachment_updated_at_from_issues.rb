class RemovePictureFileNameAndPictureContentTypeAndPictureFileSizeAndPictureUpdatedAtAndAttachmentFileNameAndAttachmentContentTypeAndAttachmentFileSizeAndAttachmentUpdatedAtFromIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :picture_file_name, :string
    remove_column :issues, :picture_content_type, :string
    remove_column :issues, :picture_file_size, :integer
    remove_column :issues, :picture_updated_at, :datetime
    remove_column :issues, :attachment_file_name, :string
    remove_column :issues, :attachment_content_type, :string
    remove_column :issues, :attachment_file_size, :integer
    remove_column :issues, :attachment_updated_at, :datetime
  end
end
