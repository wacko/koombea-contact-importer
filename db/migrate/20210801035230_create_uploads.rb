class CreateUploads < ActiveRecord::Migration[6.1]
  def change
    create_table :uploads do |t|
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.string :name_column
      t.string :date_of_birth_column
      t.string :phone_column
      t.string :address_column
      t.string :credit_card_column
      t.string :email_column

      t.timestamps
    end
  end
end
