class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :collections, dependent: :destroy
  has_many :albums, through: :collections

  has_many :orders

 # validates :first_name, :last_name, :address, :zip_code, :city_name, :country, :phone, presence: true
 # validates :first_name, :last_name, length: { minimum: 1, message: "Doit avoir plus d'un caractère" }
end
