# == Schema Information
#
# Table name: tabs
#
#  id          :integer          not null, primary key
#  title       :string
#  num_of_tabs :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  topic_id    :integer
#

class Tab < ApplicationRecord
  belongs_to :topic
  has_many :sections, :dependent => :destroy
end
