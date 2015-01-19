class Api::LikesController < ApplicationController
  def show
    @like = Like.find_by_liker_id(params[:id])
  end

  def index
    @likes = Like.where({ liker_id: current_user.id })
  end

  def create
    @like = Like.new({ liker_id: current_user.id, likee_id: params[:likee_id] })
    @like.save!
    render json: {}
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy!
    render json: {}
  end

  def like_params
    params.require(:like).permit(:likee_id)
  end
end
