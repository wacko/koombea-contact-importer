require 'csv'
class Upload < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  before_create :default_values

  enum status: [ :on_hold, :processing, :failed, :finished ]

  def default_values
    self.status = :on_hold
  end

  def import_contacts
    processing!
    CSV.parse(file.download, headers: true) do |row|
      data = {
        name: row[self.name_column],
        date_of_birth: row[self.date_of_birth_column],
        phone: row[self.phone_column],
        address: row[self.address_column],
        credit_card: row[self.credit_card_column],
        email: row[self.email_column]
      }
      user.contacts.create(data)
    end

    finished!
  end
end
