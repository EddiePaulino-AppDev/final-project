# == Schema Information
#
# Table name: resources
#
#  id         :integer          not null, primary key
#  category   :string
#  tab_id     :integer
#  resource   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Resource < ApplicationRecord
  mount_uploader :resource, ResourceUploader
  belongs_to :tab
end
