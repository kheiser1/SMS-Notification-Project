class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, :null => false, :unique => true
      t.string :email, :null => false, :unique => true
      t.boolean :email_notifications, :default => true
      t.boolean :phone_notifications, :default => true
      t.string :login
      t.string :password_digest
      t.string :phone
      t.timestamps
    end
  end
end
