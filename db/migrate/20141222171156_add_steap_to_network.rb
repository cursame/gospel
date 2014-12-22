class AddSteapToNetwork < ActiveRecord::Migration
  def change
    add_column :networks, :steap, :integer
  end
end
