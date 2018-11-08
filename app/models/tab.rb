# == Schema Information
#
# Table name: tabs
#
#  id          :integer          not null, primary key
#  title       :string
#  num_of_tabs :integer
#  tab_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Tab < ApplicationRecord
end
