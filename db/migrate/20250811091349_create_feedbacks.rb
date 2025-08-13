class CreateFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :feedbacks do |t|
      t.references :play_session, null: false, foreign_key: true
      t.integer :score, null: false, default: 0
      t.text :notes
      t.timestamps
    end
  end
end
