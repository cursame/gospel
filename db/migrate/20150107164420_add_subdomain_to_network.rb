class AddSubdomainToNetwork < ActiveRecord::Migration
  def change
    add_column :networks, :subdomain, :string, default: 'demo'
  end
end
