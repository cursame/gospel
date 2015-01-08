class Network < ActiveRecord::Base
    validates :network_name, presence: true, uniqueness: true
    validates :subdomain, presence: true, uniqueness: true

	after_create do 
		self.token_network = SecureRandom.hex(5)
		self.steap = 1
		self.save
	end
end
