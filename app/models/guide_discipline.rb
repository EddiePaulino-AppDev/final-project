# == Schema Information
#
# Table name: guide_disciplines
#
#  id            :integer          not null, primary key
#  guide_id      :integer
#  discipline_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class GuideDiscipline < ApplicationRecord
  belongs_to :guide
  belongs_to :discipline
end
