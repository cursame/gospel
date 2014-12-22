class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :token_network
      t.string :network_name
      t.timestamps
    end
  end
end
