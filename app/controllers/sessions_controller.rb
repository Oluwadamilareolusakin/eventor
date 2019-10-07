# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :current_user_exists?, except: %i[destroy]
  def new; end

  def edit
    user = User.find_by(email: params[:email])
    if user
      if user.valid_session? && user.authenticates?(:session, params[:id])
        login(user)
        remember(user)
        redirect_back_or_to user
      else
        flash[:failure] = 'Invalid login attempt'
        render :new
      end
    else
      flash[:failure] = 'Invalid email'
      redirect_to root_path
    end
  end

  def create
    if params[:session][:email].empty?
      flash[:failure] = 'Please enter your email'
      render :new
    else
      @user = User.find_by(email: params[:session][:email].downcase)
      if @user
        login(@user)
        redirect_to @user
      else
        flash[:failure] = 'Please check your email and try again'
        render :new
      end
    end
  end

  def confirmation
    redirect_to(root_path) && return if params[:format].nil?
    @name = params[:format].split(' ')[0]
    render template: 'sessions/confirmation'
  end

  def destroy
    logout if logged_in?
    redirect_to root_path unless logged_in?
  end
end
