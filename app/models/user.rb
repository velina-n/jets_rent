# app/models/user.rb
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Les associations doivent être définies dans le bon ordre
  has_many :bookings, dependent: :destroy
  has_many :jets, dependent: :destroy
end
