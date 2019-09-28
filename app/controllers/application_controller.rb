class ApplicationController < ActionController::Base
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find_by(id: user_id) 
    elsif user_id = cookies.signed[:user_id]
      user = User.find_by(id: user_id)
      login(user)
    end
  end

  def remember(user)
    user.remember
    cookies.signed.permanent[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:remember_token)
    cookies.delete(:user_id)
  end

  def logout
    forget(current_user)
    session.delete(:user_id)
  end
end
