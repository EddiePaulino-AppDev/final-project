# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#  tab_id     :integer
#

class Section < ApplicationRecord
  belongs_to :tab
  has_many :text_components, :dependent => :destroy
end
