class RankingsController < ApplicationController
  def good
    @ranking_counts = Ownership.ranking
    @topics = Topic.find(@ranking_counts.keys)
  end
end
