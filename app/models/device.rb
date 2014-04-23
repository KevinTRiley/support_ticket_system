class Device < ActiveRecord::Base
  has_many :issues, dependent: :destroy

end
