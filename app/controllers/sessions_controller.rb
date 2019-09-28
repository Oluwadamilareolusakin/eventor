class SessionsController < ApplicationController
  def new
  end

  def edit
    user = User.find_by(email: params[:email])
    if user & user.is_valid_session_token? && @user.authenticates?(:session, params[:id])
      login(user)
      redirect_to user
    else
      flash[:failure] = "Invalid login attempt"
      render :new
    end

  end
  
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user
      @user.attempt_to_login
      @user.send_login_mail
      render 'confirmation'
    else
      flash[:failure] = "Please check your email and try again"
      render :new
    end
  end

  def destroy
    logout
  end
end
