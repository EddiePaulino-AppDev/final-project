class ChangeText < ActiveRecord::Migration[5.1]
  def change
      add_column :text_components, :section_id, :integer
      remove_column :text_components, :tab_id
  end
end
