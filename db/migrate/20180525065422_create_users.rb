class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :first_name
      t.string :last_name
      t.integer :gender, default: 0
      t.string :country
      t.text :description
      t.string :avatar
    end
  end
end
