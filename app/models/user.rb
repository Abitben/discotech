# frozen_string_literal: true

class User < ApplicationRecord

  after_create :welcome_send
  paginates_per 10

  has_one_attached :avatar

  validates :avatar, attached: false, content_type: [:png, :jpg, :jpeg]
      # Include default devise modules. Others available are:
  # ,:confirmable, :lockable, :timeoutable, :trackable and :omniauthable




  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :collections, dependent: :destroy
  has_many :albums, through: :collections

  has_many :orders, dependent: :destroy

  validate :password_complexity

  def password_complexity
    return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/

    errors.add :password, 'Veuillez inclure : 1 lettre capitale, 1 lettre minuscule, 1 chiffre and 1 caractère spécial'
  end


  def order_send
    UserMailer.order_send(self).deliver_now
  end
end
