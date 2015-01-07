class AdminController < ApplicationController

	def analitics
		@total_user = User.count
		@total_networks = Network.count
		@user_finish_training = User.where(finish_training: true).count
		@network_finish_training = Network.where(finish_training: true).count
		@user_no_finish_training = User.where(finish_training: false).count
		@network_no_finish_training = Network.where(finish_training: false).count

	end

	def loggin
	end

	def capacite
		if params[:l] == '1mfir'
			session[:admin] = true
		end
	end

	def filter
		if session[:admin] != true
			redirec_to root_path
		end
	end
end
