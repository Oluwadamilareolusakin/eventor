# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@eventor.com'
  layout 'mailer'
end
