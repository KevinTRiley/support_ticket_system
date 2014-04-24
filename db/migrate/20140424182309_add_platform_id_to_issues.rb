class AddPlatformIdToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :platform_id, :integer
  end
end
