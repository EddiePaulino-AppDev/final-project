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
  has_many :connect_disciplines, :class_name => "ConnectDiscipline", :dependent => :destroy
  has_many :disciplines, :through => :connect_disciplines, :source => :discipline
  has_many :connect_industries, :class_name => "ConnectIndustry",:dependent => :destroy
  has_many :industries, :through => :connect_industries, :source => :industry
  validates :title, uniqueness: true
  validates :title, :csi_section, presence: true
  has_paper_trail
end
