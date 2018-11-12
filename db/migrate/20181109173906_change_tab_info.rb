class ChangeTabInfo < ActiveRecord::Migration[5.1]
  def change
      add_column :tabs, :topic_id, :integer
      remove_column :tabs, :tab_id
  end
end
