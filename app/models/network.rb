class Network < ActiveRecord::Base

	after_create do 
		self.token_network = SecureRandom.hex(5)
		self.steap = 1
		self.save
	end
end
