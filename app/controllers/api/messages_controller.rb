class Api::MessagesController < ApplicationController
  def index

  end

  def show
  end

  def create
  end

  def message_params
    params.require(:message).permit(:title, :receiver_id)
  end
end
