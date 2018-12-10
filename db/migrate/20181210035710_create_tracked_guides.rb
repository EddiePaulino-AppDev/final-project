class CreateTrackedGuides < ActiveRecord::Migration[5.1]
  def change
    create_table :tracked_guides do |t|
      t.integer :user_id
      t.integer :guide_id

      t.timestamps
    end
  end
end
