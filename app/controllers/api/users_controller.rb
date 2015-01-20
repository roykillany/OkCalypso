class Api::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    render json: @user
  end

  # def show
  #   @user = User.find(params[:id])
  #   if @user
  #     render :show
  #   else
  #     redirect_to :index
  #   end
  # end

  def create
    @user = User.new(user_params)
    @user.profile = Profile.new(user_id: @user.id)
    @user.preferences = Preference.new(user_id: @user.id)
    if @user.save
      p "SAVED!"
      log_in(@user)
      render json: @user
    else
      p "NOT SAVED!"
      flash.now[:errors] = @user.errors.full_messages
      render json: @user.errors.full_messages, status: 422
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    log_out!
  end

  def edit
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      render :show
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :orientation, :gender, :country, :zip_code, :avatar)
  end
end
