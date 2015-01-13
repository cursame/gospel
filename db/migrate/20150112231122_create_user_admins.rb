class CreateUserAdmins < ActiveRecord::Migration
  def change
    create_table :user_admins do |t|
      t.string :email
      t.string :password
      t.string :salt

      t.timestamps
    end
  end
end
