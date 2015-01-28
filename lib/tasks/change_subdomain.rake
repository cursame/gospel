task :change_subdomain do
	@users = User.find(:all)
	 @users.each  do |user|
		 if user.subdomain != user.network_name
		 	user.user.subdomain  = user.network_name
		 	user.save
		 end
	 end
end