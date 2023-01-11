class UserMailer < ApplicationMailer
    default from: 'welcome@ticketpoa.com'

    def welcome_email
        @user = params[:user]
        @url = 'http://ticketpoa.com/login'
        mail(to: email_address_with_name(@user.email, @user.name), subject: 'Welcome to TicketPoa')
    end
end
