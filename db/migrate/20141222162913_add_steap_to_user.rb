class AddSteapToUser < ActiveRecord::Migration
  def change
    add_column :users, :steap, :integer
  end
end
