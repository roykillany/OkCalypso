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

  def guest_create
    orientation = ["Straight", "Gay", "Bisexual", "Demisexual",
    "Heteroflexible", "Homoflexible", "Lesbian", "Pansexual", "Queer",
    "Questioning", "Sapiosexual"]
    gender = ["Woman", "Man", "Agender", "Androgynous", "Bigender",
    "Cis Man", "Cis Woman", "Genderfluid", "Genderqueer", "Gender Nonconforming",
    "Hijira", "Intersex", "Non-binary", "Other", "Pangender", "Transfeminine",
    "Transgender", "Transmasculine", "Transsexual", "Trans Man", "Trans Woman",
    "Two Spirit"]

    guest_orientation = orientation[rand(orientation.length)]
    guest_gender = gender[rand(gender.length)]

    guest_username = Faker::Internet.user_name
    guest_pass = Faker::Internet.password(6)
    guest_email = Faker::Internet.free_email
    guest_country = Faker::Address.country
    guest_zip = Faker::Address.zip_code
    guest_avatar = process_uri(UIFaces::face)

    userData = {
      username: guest_username,
      email: guest_email,
      password: guest_pass,
      orientation: guest_orientation,
      gender: guest_gender,
      country: guest_country,
      zip_code: guest_zip,
      avatar: guest_avatar,
      is_guest: true,
      searchable: true,
    }

    @guest = User.new(userData)

    profileData = {
      user_id: @guest.id,
      self_sum: Faker::Lorem.paragraph,
      life_sum: Faker::Lorem.paragraph,
      skills: Faker::Lorem.paragraph,
      favorites: Faker::Lorem.paragraph,
      needs: Faker::Lorem.paragraph,
      thoughts: Faker::Lorem.paragraph,
      fun_acts: Faker::Lorem.paragraph,
      msg_reason: Faker::Lorem.paragraph
    }

    preferencesData = {
      user_id: @guest.id,
    }

    @guest.profile = Profile.new(profileData)
    @guest.preferences = Preference.new(preferencesData)
    if @guest.save
      log_in(@guest)
      render json: @guest
    else
      flash.now[:errors] = @guest.errors.full_messages
      render json: @guest.errors.full_messages, status: 422
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    log_out!
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      render json: @user
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :orientation, :gender, :country, :zip_code, :avatar)
  end

  def process_uri(uri)
    require 'open-uri'
    require 'open_uri_redirections'
    open(uri, :allow_redirections => :safe) do |r|
      r.base_uri.to_s
    end
  end
end
