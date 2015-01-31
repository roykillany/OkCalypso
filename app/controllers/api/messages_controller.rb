class Api::MessagesController < ApplicationController
  def index
    @messages = Message.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
  end

  def show
    @message = Message.find(params[:id])
  end

  def create
    @message = current_user.sent_messages.build(message_params)
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
