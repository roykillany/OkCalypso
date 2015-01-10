class MessagesController < ApplicationController
  def create

  end

  def show
  end

  def destroy
  end

  def index
    @messages = Message.find_by_sender_id(current_user.id)
    render json: @messages
  end

  def message_params
    params.require(:message).permit(:receiver_id, :title, :sender_id, :body)
  end
end
