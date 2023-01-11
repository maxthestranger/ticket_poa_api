require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "welcome_email" do
    let(:user) { create(:user) }
    let(:mail) { UserMailer.welcome_email(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome to Ticket Poa")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["noreply@ticketpoa.com"])


    it "renders the body" do
      expect(mail.body.encoded).to match("Welcome to ticketpoa.com")
    end
end
