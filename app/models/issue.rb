# == Schema Information
#
# Table name: issues
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  state       :string(255)
#  urgency     :integer
#  picture     :string(255)
#  attachment  :string(255)
#  email       :string(255)
#  device_id   :integer
#  platform_id :integer
#  category_id :integer
#

class Issue < ActiveRecord::Base
  belongs_to :device

  has_one :resolution

  belongs_to :platform
  belongs_to :category
  mount_uploader :picture, PictureUploader
  mount_uploader :attachment, AttachmentUploader
  validates :description, :state, :urgency, :device_id, :platform_id, :category_id, presence: true
  STATE_OPTIONS = ["New", "In Progress", "Resolved", "Rejected"]
  URGENCY_OPTIONS = [0, 1, 2, 3, 4]

  def resolution_id
    resolution ? resolution.id : nil
  end

end

