class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user
    @greeting = "Hi #{user.first_name}, welcome to Tool Time, the place to trade your gear."

    mail(to: @user.email, subject: "Welcome")
  end
end
