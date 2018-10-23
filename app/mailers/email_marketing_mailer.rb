class EmailMarketingMailer < ApplicationMailer


  def send_email
    @email = params[:email]
    mail(to: @email.reciver_email, subject: @email.email_subject)
  end


end
