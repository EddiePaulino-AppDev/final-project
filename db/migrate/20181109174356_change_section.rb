class ChangeSection < ActiveRecord::Migration[5.1]
  def change
      add_column :sections, :tab_id, :integer
      remove_column :sections, :topic_id
  end
end
