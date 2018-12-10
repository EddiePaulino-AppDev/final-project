class CreateYoutubeVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :youtube_videos do |t|
      t.integer :tab_id
      t.string :url_link
      t.string :description

      t.timestamps
    end
  end
end
