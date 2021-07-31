class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #   :recoverable, :validatable, :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable
end
