class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :date_of_birth
      t.string :phone
      t.string :address
      t.string :credit_card
      t.string :last_numbers
      t.string :franchise
      t.string :email

      t.timestamps
    end
  end
end
