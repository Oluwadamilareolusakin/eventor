class CreateInvitings < ActiveRecord::Migration[6.0]
  def change
    create_table :invitings do |t|
      t.integer :invited_id, foreign_key: true
      t.integer :inviter_id, foreign_key: true
      t.integer :event_id, foreign_key: true
      t.timestamps
    end

    add_index :invitings, :inviter_id
    add_index :invitings, :invited_id
    add_index :invitings, :event_id
    add_index :invitings, [:event_id, :inviter_id, :invited_id], unique: true
  end
end
