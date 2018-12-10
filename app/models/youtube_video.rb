# == Schema Information
#
# Table name: youtube_videos
#
#  id          :integer          not null, primary key
#  tab_id      :integer
#  url_link    :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class YoutubeVideo < ApplicationRecord
  belongs_to :tab
end
