# == Schema Information
#
# Table name: guides
#
#  id          :integer          not null, primary key
#  csi_section :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tags        :text
#

class Guide < ApplicationRecord

  has_many :tabs, :dependent => :destroy
  has_many :stars, :dependent => :destroy
  has_many :guide_disciplines, :dependent => :destroy
  has_many :disciplines, :through => :guide_disciplines, :source => :discipline
  has_many :guide_industries, :dependent => :destroy
  has_many :industries, :through => :guide_industries, :source => :industry
  validates :title, uniqueness: true
  validates :title, :csi_section, presence: true
  has_paper_trail
end
