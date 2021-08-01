require 'rails_helper'

RSpec.describe Upload, type: :model do
  fixtures :uploads

  let(:file) { File.open('spec/fixtures/files/valid.csv') }

  def create_upload
    uploads(:one_contact).tap do |upload|
      upload.file.attach(io: file, filename: 'valid.csv')
    end
  end

  context 'import_contacts' do
    it 'works' do
      upload = create_upload
      expect(upload).to be_on_hold

      upload.import_contacts

      expect(upload).to be_finished
      expect(upload.user.contacts.count).to be(1)
    end
  end
end
