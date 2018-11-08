class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :csi_section
      t.string :title
      t.string :engineering_discipline

      t.timestamps
    end
  end
end
