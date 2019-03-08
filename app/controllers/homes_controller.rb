class HomesController < ApplicationController
  def index
    if user_signed_in?
      @topics = Topic.all.page(params[:page])

    end
  end
end
