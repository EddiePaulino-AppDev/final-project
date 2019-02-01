# == Schema Information
#
# Table name: text_components
#
#  id         :integer          not null, primary key
#  tab_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  content    :text
#

class TextComponent < ApplicationRecord
  belongs_to :tab
end
