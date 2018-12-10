# == Schema Information
#
# Table name: tabs
#
#  id          :integer          not null, primary key
#  title       :string
#  num_of_tabs :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  guide_id    :integer
#

class Tab < ApplicationRecord
  belongs_to :guide
  has_many :text_components, :dependent => :destroy
  has_many :resources, :dependent => :destroy
end
