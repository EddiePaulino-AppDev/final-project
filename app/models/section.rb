# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  topic_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Section < ApplicationRecord
end
