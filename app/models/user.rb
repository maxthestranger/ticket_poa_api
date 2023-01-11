# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models

  after_create :send_welcome_email

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  enum role: [:admin, :organizer, :buyer]

  validates :name, presence: true, length: { maximum: 50 }
  validates :role, presence: true, inclusion: { in: roles.keys }, allow_nil: false, allow_blank: false
  validates :email, presence: true, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: false, allow_blank: false

  has_many :events, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :payments, dependent: :destroy


  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end

end
