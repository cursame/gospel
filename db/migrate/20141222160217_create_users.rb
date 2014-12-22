class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :role
      t.string :network_name
      t.string :type_network
      t.date :loggin_first
      t.date :last_loggin

      t.timestamps
    end
  end
end
