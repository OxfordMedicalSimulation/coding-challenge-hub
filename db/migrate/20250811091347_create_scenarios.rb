class CreateScenarios < ActiveRecord::Migration[7.1]
  def change
    create_table :scenarios do |t|
      t.string :title, null: false
      t.text :description
      t.string :modality, null: false, default: "desktop" # desktop or vr
      t.timestamps
    end
    add_index :scenarios, :modality
  end
end
