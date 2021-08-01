require 'rails_helper'

RSpec.describe 'Upload a file', type: :system do
  fixtures :users

  it 'sucessful file upload' do
    login

    visit new_upload_url
    expect(page).to have_text('Upload new contacts')

    attach_file('File', Rails.root + "spec/fixtures/files/valid.csv")
    click_button 'Upload'

    expect(Upload.count).to eq(1)
    expect(current_path).to eq(uploads_path)
    expect(page).to have_text('on hold')
  end
end
