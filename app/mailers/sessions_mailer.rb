class SessionsMailer < ApplicationMailer
  def login_validation(user)
    @user = user
    mail to: user.email, subject: 'Login to Eventor'
  end
end
