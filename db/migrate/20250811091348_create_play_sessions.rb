class CreatePlaySessions < ActiveRecord::Migration[7.1]
  def change
    create_table :play_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :scenario, null: false, foreign_key: true
      t.datetime :started_at, null: false
      t.datetime :ended_at
      t.timestamps
    end

    add_index :play_sessions, [ :user_id, :scenario_id, :started_at ], unique: true, name: "idx_unique_session_start"
  end
end
