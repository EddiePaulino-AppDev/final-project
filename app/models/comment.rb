# == Schema Information
#
# Table name: comments
#
#  id                      :integer          not null, primary key
#  user_id                 :integer
#  discussion_id           :integer
#  body                    :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  cached_votes_total      :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_votes_down       :integer          default(0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  cached_weighted_average :float            default(0.0)
#

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :discussion
  acts_as_votable
end
