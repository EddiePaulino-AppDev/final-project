class CreateTextComponents < ActiveRecord::Migration[5.1]
  def change
    create_table :text_components do |t|
      t.integer :tab_id
      t.timestamps
    end
  end
end
