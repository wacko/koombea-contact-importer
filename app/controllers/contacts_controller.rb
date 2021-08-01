class ContactsController < ApplicationController
  def index
    @pagy, @contacts = pagy(current_user.contacts)
  end
end
