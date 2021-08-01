class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #   :recoverable, :validatable, :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable

  has_many :uploads

  validates_confirmation_of :password, only: :create
end
