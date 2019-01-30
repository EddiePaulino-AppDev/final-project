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
#  tags        :text
#  industries  :string
#

class Guide < ApplicationRecord

  has_many :tabs, :dependent => :destroy
  has_many :tracked_guides, :dependent => :destroy
  has_many :guide_disciplines, :dependent => :destroy
  has_many :disciplines, :through => :guide_disciplines, :source => :discipline
  has_many :guide_industries, :dependent => :destroy
  has_many :industries, :through => :guide_industries, :source => :industry
  validates :title, uniqueness: true
  validates :title, :industries, :discipline, :csi_section, presence: true
  has_paper_trail
end
