class AddArticleIdToConnectIndustries < ActiveRecord::Migration[5.1]
  def change
    add_column :connect_industries, :article_id, :integer
  end
end
