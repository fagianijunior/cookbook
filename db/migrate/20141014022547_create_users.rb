class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :avatar
      t.string :email
      t.string :password_digest
      t.date :birth
      t.references :gender, index: true

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end