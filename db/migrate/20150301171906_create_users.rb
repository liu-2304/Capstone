class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :remember_token
      t.string :password
      t.string :security_level

      t.timestamps null: false
    end
  end
end
