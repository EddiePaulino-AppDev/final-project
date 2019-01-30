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
  has_many :guide_industries, :dependent => :destroy
  has_many :guides, :through => :guide_industries, :source => :guide
end
