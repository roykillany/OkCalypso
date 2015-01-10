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
    @message = current_user.sent_messages.build(message_params)
    # @message = Message.new(message_params)
    if @message.save!
      render json: @message
    else
      render json: @message.errors.full_messages
    end
  end

  def message_params
    params.require(:message).permit(:title, :receiver_id, :sender_id, :body)
  end
end
