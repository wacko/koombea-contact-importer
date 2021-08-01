class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #   :recoverable, :validatable, :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable

  has_many :uploads
  has_many :contacts

  validates_confirmation_of :password, only: :create
end
