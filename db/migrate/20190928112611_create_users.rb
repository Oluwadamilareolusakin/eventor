class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :session_digest
      t.string :username, null: false
      t.string :name, null: falsex

      t.timestamps
    end
  end
end
