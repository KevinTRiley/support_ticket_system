class AddUrgencyToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :urgency, :integer
  end
end
