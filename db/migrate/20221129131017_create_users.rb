class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :login, null: false, index: { unique: true }
      t.string :password_digest
      t.timestamps
    end
  end
end
