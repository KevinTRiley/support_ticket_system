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
  include ActionView::Helpers::UrlHelper

  belongs_to :device
  belongs_to :platform
  belongs_to :category
  has_one :resolution

  mount_uploader :picture, PictureUploader
  mount_uploader :attachment, AttachmentUploader
  validates :description, :state, :urgency, :device_id, :platform_id, :category_id, presence: true

  STATE_OPTIONS = ["New", "In Progress", "Resolved", "Rejected"]
  URGENCY_OPTIONS = [0, 1, 2, 3, 4]

  def device_link
    device ? link_to(device.name, Rails.application.routes.url_helpers.device_path(device.id)) : nil
  end

  def platform_link
    platform ? link_to(platform.name, Rails.application.routes.url_helpers.platform_path(platform.id)) : nil
  end

  def category_link
    category ? link_to(category.name, Rails.application.routes.url_helpers.category_path(category.id)) : nil
  end

  def resolution_link
    resolution ? link_to(("Resolved " + resolution.created_at.to_formatted_s(:long_date_short_time)), Rails.application.routes.url_helpers.resolution_path(resolution.id)) : nil
  end

end

