class AddTitleToSections < ActiveRecord::Migration[5.1]
  def change
      add_column :sections, :title, :string

  end
end
