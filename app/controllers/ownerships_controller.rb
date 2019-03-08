class OwnershipsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    current_user.good(@topic)
    redirect_to root_url
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    current_user.ungood(@topic)
    redirect_to root_url
  end
end
