class SessionsController < ApplicationController
  before_action :current_user_exists?, except: %i[ destroy ]
  def new
  end

  def edit
    user = User.find_by(email: params[:email])
    if user 
      if user.is_valid_session? && user.authenticates?(:session, params[:id])
        login(user)
        remember(user)
        redirect_back_or_to user
      else
        flash[:failure] = "Invalid login attempt"
        render :new
      end
    else
      flash[:failure] = "Invalid email"
      redirect_to root_path
    end
  end
  
  def create
    unless params[:session][:email].empty?
      @user = User.find_by(email: params[:session][:email].downcase)
      if @user
        @user.attempt_to_login
        @user.send_login_email
        redirect_to sessions_confirmation_path(@user.name)
      else
        flash[:failure] = "Please check your email and try again"
        render :new
      end
    else
      flash[:failure] = "Please enter your email"
      render :new
    end
  end

  def confirmation
    redirect_to root_path and return if params[:format].nil?
    @name = params[:format].split(" ")[0]
    render template: 'sessions/confirmation'
  end

  def destroy
    logout
  end
end
