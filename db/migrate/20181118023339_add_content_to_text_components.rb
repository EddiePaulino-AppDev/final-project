class AddContentToTextComponents < ActiveRecord::Migration[5.1]
  def change
    add_column :text_components, :content, :text
  end
end
