class AddArticleIdToConnectDisciplines < ActiveRecord::Migration[5.1]
  def change
  add_column :connect_disciplines, :article_id, :integer
  end
end
