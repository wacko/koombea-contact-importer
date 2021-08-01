class Contact < ApplicationRecord
  belongs_to :user

  validates :name, format: { with: /\A[a-zA-Z -]+\z/, message: 'only allows letters' }
end
