class Api::SessionsController < ApplicationController
  def show
    render json: current_user || {}
  end
end
