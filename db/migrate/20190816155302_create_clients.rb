class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string  :username
      #security
      t.string :password_digest
    
    end
    
  end
end
