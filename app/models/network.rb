class Network < ActiveRecord::Base
    validates :network_name, presence: true
    validates :subdomain, presence: true

	after_create do 
		self.token_network = SecureRandom.hex(5)
		self.steap = 1
		self.finish_training = true 
		self.save
	end

	def users
		@subdomain =  self.subdomain
		@users = User.where(subdomain:@subdomain )
	end

	def acomplishment_prom
		if self.users.count == 0
			self.users.count
		else
		@a = self.users.count
		@b = self.users.where(finish_training: true).count
		@c = (@b.to_f/@a.to_f)*100
		@c.to_i
	    end
	end

	def acomplishment_steaps
	    @x = (self.steap.to_f/6.to_f)*100
	    @x.to_f

	end
end
