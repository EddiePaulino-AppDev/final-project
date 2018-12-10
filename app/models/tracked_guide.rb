# == Schema Information
#
# Table name: tracked_guides
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  guide_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TrackedGuide < ApplicationRecord
  belongs_to :user
  belongs_to :guide
end
