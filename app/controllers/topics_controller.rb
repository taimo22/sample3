class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]
  def new
    @topic = current_user.topics.build
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      flash[:notice] = 'Topicを投稿しました。'
      redirect_to root_url
    else
      @topics = current_user.topics.order('created_at DESC').page(params[:page])
      flash.now[:alert] = 'Topicの投稿に失敗しました。'
      render 'topics/new'
    end
  end

  def destroy
    @topic.destroy
    flash[:success] = 'Topicを削除'
    redirect_back(fallback_location: root_path)
  end

  private
  def topic_params
    params.require(:topic).permit(:content, :name)
  end

  def correct_user
    @topic = current_user.topics.find_by(id: params[:id])
    unless @topic
      redirect_to root_url
    end
  end
end
