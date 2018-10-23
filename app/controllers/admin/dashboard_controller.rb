class Admin::DashboardController < ApplicationController

  #authenticate user is login
   before_action :authenticate_user!

  def index
    @user = User.first
  #  UserMailer.with(user: @user).welcome_email.deliver_now

  end

end
