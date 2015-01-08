class LikesController < ApplicationController
  before_action :ensure_logged_in

  def create
    @like = Like.new(like_params)
    if @like.save
      redirect_to user_url(like_params[:likee_id])
    else
      flash.now[:errors] = @like.errors.full_messages
    end
  end

  def index
    @likes = User.find_by_id(params[:user_id]).likees.uniq
    render :index
  end

  def like_params
    params.require(:like).permit(:liker_id, :likee_id)
  end
end
