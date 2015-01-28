class User < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true
	after_create do 

		if  self.network_name == 'demo' 
		 	self.user.subdomain  = user.network_name
		end

		if self.network_name == nil 
			self.user.subdomain  = user.network_name
		end
		self.steap = 1
		self.save
	end

	def acomplishment_steaps
		case self.role 
		when 'student'
			@s = 8
		when 'teacher'
			@s = 8
		when 'admin'
			@s = 7
		else
			@s = 1
		end 
		    if self.steap == 0
		    	self.steap = 1
		    	self.save
		    	@c = (self.steap.to_f/@s.to_f)*100
			    @c.to_i
		    else
			    @c = (self.steap.to_f/@s.to_f)*100
			    @c.to_i
		    end
	end


end
