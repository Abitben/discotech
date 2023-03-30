class User < ApplicationRecord
  # after_create :welcome_send
  paginates_per 10
  
  has_one_attached :avatar #do |attachable|
    #attachable.variant :thumb, resize_to_limit: [100, 100]
  #end
  
  # Include default devise modules. Others available are:
  # ,:confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  # User Wishlist
  has_one :wishlist 


  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :collections, dependent: :destroy
  has_many :albums, through: :collections

  has_many :orders, dependent: :destroy

  validate :password_complexity
  validates :phone, numericality: { only_integer: true }

  def password_complexity
    return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/
    errors.add :password, 'Veuillez inclure : 1 lettre capitale, 1 lettre minuscule, 1 chiffre and 1 caractère spécial'
  end


 # validates :first_name, :last_name, :address, :zip_code, :city_name, :country, :phone, presence: true
 # validates :first_name, :last_name, length: { minimum: 1, message: "Doit avoir plus d'un caractère" }
  def order_send
  UserMailer.order_send(self).deliver_now
  end

end
