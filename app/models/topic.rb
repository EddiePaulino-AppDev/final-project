# == Schema Information
#
# Table name: topics
#
#  id                     :integer          not null, primary key
#  csi_section            :string
#  title                  :string
#  engineering_discipline :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Topic < ApplicationRecord
end
