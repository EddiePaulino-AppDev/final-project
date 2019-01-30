# == Schema Information
#
# Table name: disciplines
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Discipline < ApplicationRecord
  has_many :guide_disciplines, :dependent => :destroy
  has_many :guides, :through => :guide_disciplines, :source => :guide
end
