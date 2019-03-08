class CreateOwnerships < ActiveRecord::Migration[5.2]
  def change
    create_table :ownerships do |t|
      t.references :user, foreign_key: true
      t.references :topic, foreign_key: true

      t.timestamps

      t.index [:user_id, :topic_id], unique: true
    end
  end
end
