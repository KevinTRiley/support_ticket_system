class Issue < ActiveRecord::Base
    has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }
    validates_attachment :picture, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
    validates :description, :state, :urgency, presence: true
    STATE_OPTIONS = ["New", "In Progress", "Resolved", "Rejected"]
    URGENCY_OPTIONS = [0, 1, 2, 4]

end

