class HomesController < ApplicationController
  def index
    if user_signed_in?
      @topics = Topic.all.order('created_at DESC').page(params[:page])

    end
  end
end
