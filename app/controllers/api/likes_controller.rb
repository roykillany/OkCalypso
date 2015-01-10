class Api::LikesController < ApplicationController
  def show
    @like = Like.find_by_liker_id(params[:id])
    render json: @like || {}
  end

  def index
    @likes = Like.all
    render json: @likes
  end
end
