class CreateGuides < ActiveRecord::Migration[5.1]
  def change
    create_table :guides do |t|
      t.string :csi_section
      t.string :title
      t.string :discipline

      t.timestamps
    end
  end
end
