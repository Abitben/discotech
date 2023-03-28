class User < ApplicationRecord
  paginates_per 10
  
  has_one_attached :avatar #do |attachable|
    #attachable.variant :thumb, resize_to_limit: [100, 100]
  #end
  
  # after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :collections, dependent: :destroy
  has_many :albums, through: :collections

  has_many :orders

 # validates :first_name, :last_name, :address, :zip_code, :city_name, :country, :phone, presence: true
 # validates :first_name, :last_name, length: { minimum: 1, message: "Doit avoir plus d'un caractère" }
end
