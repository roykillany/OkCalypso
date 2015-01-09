class Api::MessagesController < ApplicationController
  def index
    @messages = Message.all
    render json: @messages
  end

  def show
    @message = Message.find(params[:id])
    render json: @message
  end

  def create
  end

  def message_params
    params.require(:message).permit(:title, :receiver_id)
  end
end
