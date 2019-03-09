class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @count_goods = @user.ownerships.count
    @count_topics = @user.topics.count
    @topics = @user.topics.order('created_at DESC').page(params[:page])
  end
  def edit
    @user = current_user
  end
  def job_edit
    @user = current_user
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = '編集完了'
      redirect_to @user
    else
      flash[:alert] = '編集失敗'
      render 'users/edit'
    end
  end
  private

  def user_params
    params.require(:user).permit(:name, :intro, :job)
  end

end
