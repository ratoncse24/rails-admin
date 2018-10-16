class UserMailer < ApplicationMailer
  default from: "ratoncse24@gmail.com"

  #send welcome email to the user
  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end


end
