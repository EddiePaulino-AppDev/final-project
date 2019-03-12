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
  has_many :connect_disciplines, :class_name => "ConnectDiscipline", :dependent => :destroy
  has_many :guides, :through => :connect_disciplines, :source => :guide
  has_many :articles, :through => :connect_disciplines, :source => :article
end
