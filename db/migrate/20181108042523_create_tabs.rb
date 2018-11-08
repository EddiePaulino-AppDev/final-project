class CreateTabs < ActiveRecord::Migration[5.1]
  def change
    create_table :tabs do |t|
      t.string :title
      t.integer :num_of_tabs
      t.integer :tab_id

      t.timestamps
    end
  end
end
