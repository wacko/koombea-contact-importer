class ChangeUploadStatusToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :uploads, :status, :integer
  end
end
