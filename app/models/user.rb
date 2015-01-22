class User < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true
	after_create do 
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
		end 
		    if self.steap == 0 | self.steap.empty?
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
