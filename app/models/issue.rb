class Issue < ActiveRecord::Base
    validates :description, :state, :urgency, presence: true
    STATE_OPTIONS = ["New", "In Progress", "Resolved", "Rejected"]
    URGENCY_OPTIONS = [0, 1, 2, 4]

end

