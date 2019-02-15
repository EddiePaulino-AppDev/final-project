# == Schema Information
#
# Table name: articles
#
#  id                      :integer          not null, primary key
#  title                   :string
#  author                  :string
#  image                   :string
#  content                 :string
#  user_id                 :integer
#  status                  :string
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

class Article < ApplicationRecord
  has_many :connect_industries, :dependent => :destroy
  has_many :connect_disciplines, :dependent => :destroy
  has_many :industries, :through => :connect_industries, :source => :industry
  has_many :disciplines, :through => :connect_disciplines, :source => :discipline
   mount_uploader :image, ArticleImageUploader
  validates :title, :image, :author, :content, presence: true
   acts_as_votable
end
