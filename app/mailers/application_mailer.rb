class ApplicationMailer < ActionMailer::Base
  default from: ENV["DOMAIN_EMAIL"]
  layout "mailer"
end
