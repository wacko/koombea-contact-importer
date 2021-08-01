require 'rails_helper'

RSpec.describe Contact, type: :model do
  fixtures :users

  def contact params={}
    Contact.new({
      name: 'John Doe',
      date_of_birth: '1980-01-01',
      phone: '(+57) 320 432 05 09',
      address: '1st Avenue 123',
      credit_card: 371449635398431,
      email: 'john@example.com',
      user: users(:user)
    }.merge(params))
  end

  context 'validation' do
    it 'accept valid data' do
      expect(contact).to be_valid
    end
  end

  context 'name validation' do
    it 'accept dash' do
      expect(contact(name: 'John-Doe')).to be_valid
    end

    it 'reject special characters' do
      expect(contact(name: 'John Doe!')).to_not be_valid
    end
  end

  context 'email validation' do
    it 'reject spaces' do
      expect(contact(email: 'invalid email')).to_not be_valid
    end

    it 'reject special characters' do
      expect(contact(email: 'invalid!!@example.com')).to_not be_valid
    end
  end

  context 'phone validation' do
    it 'accept valid formats' do
      expect(contact(phone: '(+57) 320 432 05 09')).to be_valid
      expect(contact(phone: '(+57) 320-432-05-09')).to be_valid
    end

    it 'reject invalid formats' do
      expect(contact(phone: '+57 320 432 05 09')).to_not be_valid
      expect(contact(phone: '(+57) 320 432 0509')).to_not be_valid
    end
  end
end
