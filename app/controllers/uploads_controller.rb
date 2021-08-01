class UploadsController < ApplicationController
  def index
    @uploads = current_user.uploads.all
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = current_user.uploads.new(upload_params)

    if @upload.save
      redirect_to uploads_url, notice: "Upload was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def upload_params
      params.require(:upload).permit(:name_column, :date_of_birth_column, :phone_column, :address_column, :credit_card_column, :email_column)
    end
end
