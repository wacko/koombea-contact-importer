require 'rails_helper'

RSpec.describe Contact, type: :model do
  fixtures :users

  def contact params={}
    Contact.new({
      name: 'John Doe',
      user: users(:user)
    }.merge(params))
  end

  context 'validation' do
    it 'name accept valid letters' do
      expect(contact).to be_valid
    end

    it 'name accept dash' do
      expect(contact(name: 'John-Doe')).to be_valid
    end

    it 'name reject special characters' do
      expect(contact(name: 'John Doe!')).to_not be_valid
    end
  end
end
