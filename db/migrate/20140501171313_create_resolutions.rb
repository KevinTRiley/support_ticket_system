class CreateResolutions < ActiveRecord::Migration
  def change
    create_table :resolutions do |t|
      t.integer :issue_id
      t.text :note
      t.text :email_message

      t.timestamps
    end
  end
end
