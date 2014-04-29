class DropRecipientListsTable2 < ActiveRecord::Migration
  def up
    drop_table :recipient_lists
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
