module SessionsHelper
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

  def redirect_back_or_to(default)
    redirect_to (session[:url] || default)
    session.delete(:url)
  end

  def store_url
    session[:url] = request.get? ? request.original_url : nil
  end

  def log_in_user
    unless is_logged_in?
      store_url
      redirect_to login_path
    end
  end

  def is_logged_in?
    !current_user.nil?
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