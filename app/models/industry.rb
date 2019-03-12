# == Schema Information
#
# Table name: industries
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Industry < ApplicationRecord
  has_many :connect_industries, :class_name => "ConnectIndustry",:dependent => :destroy
  has_many :guides, :through => :connect_industries, :source => :guide
  has_many :articles, :through => :connect_industries, :source => :article
end
