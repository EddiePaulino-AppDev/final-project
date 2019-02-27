# == Schema Information
#
# Table name: discussions
#
#  id         :integer          not null, primary key
#  tab_id     :integer
#  guide_id   :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Discussion < ApplicationRecord
  belongs_to :guide
  belongs_to :tab
  acts_as_commentable
end
