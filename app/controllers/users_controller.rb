class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @count_goods = @user.ownerships.count
    @count_topics = @user.topics.count
    @topics = @user.topics.order('created_at DESC').page(params[:page])
  end
end
