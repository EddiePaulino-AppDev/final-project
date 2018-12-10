# == Schema Information
#
# Table name: guides
#
#  id          :integer          not null, primary key
#  csi_section :string
#  title       :string
#  discipline  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Guide < ApplicationRecord
  has_many :tabs, :dependent => :destroy
  has_many :tracked_guides, :dependent => :destroy
end
