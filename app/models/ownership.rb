class Ownership < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  def self.ranking
    self.group(:topic_id).order('count_topic_id DESC').limit(10).count(:topic_id)
  end
end
