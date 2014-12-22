class User < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true
	after_create do 
		self.steap = 0
		self.save
	end
end
