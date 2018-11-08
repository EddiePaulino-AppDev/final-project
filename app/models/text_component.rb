# == Schema Information
#
# Table name: text_components
#
#  id         :integer          not null, primary key
#  tab_id     :integer
#  header     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TextComponent < ApplicationRecord
end
