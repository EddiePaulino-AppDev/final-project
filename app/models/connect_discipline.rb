# == Schema Information
#
# Table name: connect_disciplines
#
#  id            :integer          not null, primary key
#  guide_id      :integer
#  discipline_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  article_id    :integer
#

class ConnectDiscipline < ApplicationRecord
  belongs_to :guide, optional: true
  belongs_to :discipline, optional: true
  belongs_to :article, optional: true
end
