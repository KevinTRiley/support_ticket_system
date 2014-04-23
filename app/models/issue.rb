class Issue < ActiveRecord::Base
  belongs_to :device
  mount_uploader :picture, PictureUploader
  mount_uploader :attachment, AttachmentUploader
  validates :description, :state, :urgency, :email, :device_id, presence: true
  STATE_OPTIONS = ["New", "In Progress", "Resolved", "Rejected"]
  URGENCY_OPTIONS = [0, 1, 2, 3, 4]

end

