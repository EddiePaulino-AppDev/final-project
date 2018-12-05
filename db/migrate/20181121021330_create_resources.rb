class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :category
      t.integer :tab_id
      t.string :resource

      t.timestamps
    end
  end
end
