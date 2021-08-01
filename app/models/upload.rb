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
    total = 0
    CSV.parse(file.download, headers: true) do |row|
      data = {
        name: row[self.name_column],
        date_of_birth: row[self.date_of_birth_column],
        phone: row[self.phone_column],
        address: row[self.address_column],
        credit_card: row[self.credit_card_column],
        email: row[self.email_column]
      }
      contact = user.contacts.create(data)
      if contact.persisted?
        total += 1
      else
        Rails.logger.info contact.errors.full_messages
      end
    end

    if total > 0
      finished!
    else
      failed!
    end
  end
end
