# == Schema Information
#
# Table name: text_components
#
#  id         :integer          not null, primary key
#  header     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section_id :integer
#  content    :text
#

class TextComponent < ApplicationRecord
  belongs_to :section
end
