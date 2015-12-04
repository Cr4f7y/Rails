class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :birthdate
      t.string :phone
      t.string :password
      t.timestamps null: false
    end
  end
end
