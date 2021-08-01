class Contact < ApplicationRecord
  belongs_to :user

  validates :name, format: { with: /\A[a-zA-Z -]+\z/, message: 'only allows letters' }
  validates :email, email: true, uniqueness: { scope: :user_id }
  validates :phone, phone: true
  validates :address, presence: true
end
