class AddTagsToGuides < ActiveRecord::Migration[5.1]
  def change
    add_column :guides, :tags, :text
  end
end
