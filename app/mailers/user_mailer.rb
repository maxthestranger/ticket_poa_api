class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url = 'https://ticketpoa.com/login'
    mail(to: email_address_with_name(@user.email, @user.name), subject: 'Welcome to Ticket Poa')
  end
end
