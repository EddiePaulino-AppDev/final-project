# == Schema Information
#
# Table name: guide_industries
#
#  id          :integer          not null, primary key
#  guide_id    :integer
#  industry_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class GuideIndustry < ApplicationRecord
  belongs_to :guide
  belongs_to :industry
end
