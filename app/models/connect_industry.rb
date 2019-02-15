# == Schema Information
#
# Table name: connect_industries
#
#  id          :integer          not null, primary key
#  guide_id    :integer
#  industry_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  article_id  :integer
#

class ConnectIndustry < ApplicationRecord
  belongs_to :guide, optional: true
  belongs_to :industry, optional: true
  belongs_to :article, optional: true
end
