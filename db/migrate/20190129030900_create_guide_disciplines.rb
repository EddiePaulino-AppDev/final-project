class CreateGuideDisciplines < ActiveRecord::Migration[5.1]
  def change
    create_table :guide_disciplines do |t|
      t.integer :guide_id
      t.integer :discipline_id

      t.timestamps
    end
  end
end
