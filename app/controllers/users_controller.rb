class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find(params[:id])
    if @user
      render :show
    else
      redirect_to :index
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in!(@user)
      redirect_to users_url
    else
      flash.now[:errors] = @user.errors.full_messages, status: 422
      render :new
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
      flash.now[:errors] = @user.errors.full_messages, status: 422
      render :edit
    end
  end

  private
  def user_params
    params.require(user).permit(:username, :email, :password)
  end
end
