class Upload < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  before_create :default_values

  def default_values
    self.status ||= 'on hold'
  end
end
