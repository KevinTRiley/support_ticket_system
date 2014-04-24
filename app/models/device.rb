class Device < ActiveRecord::Base
  has_many :issues, dependent: :destroy
  validates :name, presence: true

end
