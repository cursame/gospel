class User < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true
	after_create do 
		self.steap = 1
		self.save
	end


end
