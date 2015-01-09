class Api::LikesController < ApplicationController
  def show
    @like = Like.find(params[:id])
    render json: @like
  end

  def index
    @likes = Like.all
    render json: @likes
  end
end
