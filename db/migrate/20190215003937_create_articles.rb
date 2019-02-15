class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :image
      t.string :content
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
