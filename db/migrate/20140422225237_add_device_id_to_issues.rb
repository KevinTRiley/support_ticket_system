class AddDeviceIdToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :device_id, :integer
  end
end
