# == Schema Information
#
# Table name: topics
#
#  id          :integer          not null, primary key
#  csi_section :string
#  title       :string
#  discipline  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Topic < ApplicationRecord
  has_many :tabs, :dependent => :destroy
end
