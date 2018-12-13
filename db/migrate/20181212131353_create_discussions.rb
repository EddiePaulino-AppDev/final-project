class CreateDiscussions < ActiveRecord::Migration[5.1]
  def change
    create_table :discussions do |t|
      t.integer :tab_id
      t.integer :guide_id
      t.string :title

      t.timestamps
    end
  end
end
