class ChangeUploadStatusToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :uploads, :status, :integer, using: 'status::integer'
  end
end
