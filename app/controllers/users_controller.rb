# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  before_action :log_in_user, only: %i[index show upcoming past edit update]
  before_action :admin?, only: %i[index]
  before_action :correct_user?, only: %i[edit update show upcoming past]
  before_action :current_user_exists?, only: %i[new create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Please check your email to login'
      @user.attempt_to_login
      @user.send_login_email
      redirect_to signup_confirmation_path(@user.name)
    else
      render :new
    end
  end

  def confirmation
    redirect_to(root_path) && return unless params[:format]
    @name = params[:format].split(' ')[0]
    render template: 'users/confirmation'
  end

  def show
    @owned_events = current_user.events if is_logged_in?
  end

  def upcoming
    @upcoming_events = current_user.attendings.upcoming
    render 'upcoming_events'
  end

  def past
    @past_events = current_user.attendings.past
    render 'past_events'
  end

  def edit; end

  def update
    @user.update(user_params)
    if @user.save
      flash[:success] = "Congrats #{@user.name}!, you've successfully updated your profile!"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :username)
  end
end
