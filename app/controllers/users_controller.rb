class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Please check your email to login"
      @user.attempt_to_login
      @user.send_login_email
      render 'confirmation'
    else
      render :new
    end
  end

  def show
    @upcoming_events = @user.events.upcoming
    @past_events = @user.events.past
    @owned_events = current_user.events if is_logged_in?
  end

  def edit
  end

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