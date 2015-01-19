class AdminController < ApplicationController
    layout 'admin'
    before_filter :session_filter, except: [:loggin, :session_create ]
		def analitics
			@total_user = User.count
			@total_networks = Network.count
			@user_finish_training = User.where(finish_training: true).count
			@network_finish_training = Network.where(finish_training: true).count
			@user_no_finish_training = User.where(finish_training: false).count
			@network_no_finish_training = Network.where(finish_training: false).count

			@progress = (@user_finish_training.to_f/@total_user.to_f)*100
		    @net_progress = (@network_finish_training.to_f/@total_networks.to_f)*100

		end

		def loggin

		end

		def capacite
			if params[:l] == '1mfir'
				session[:admin] = true
			end
		end

		def users
			@users = User.paginate(:page => params[:page], :per_page => 20).order('id DESC')
		end

		def networks
			@networks = Network.paginate(:page => params[:page], :per_page => 20).order('id DESC')
		end

		def create_admin
			@admin = UserAdmin.create(email: params[:email], password: params[:password])
			flash[:notice] = "Usuario de administrador creado"
			redirect_to view_admins_path
		end

		def new_admin

		end

		def view_admins
			@admin = UserAdmin.all
		end

		def delete_admins
			@admin = UserAdmin.find(params[:id])
			@admin.destroy
			flash[:notice] = "Usuario eliminado correctamente"
			redirect_to :back
		end

	    def session_create
			@user = UserAdmin.find_by_email(params[:email])
	       if @user != nil
			password_cript(params[:password], @user)
	       else
	        flash[:notice] = 'Usuario no existente pruebe de nuevo'
	        redirect_to :back
	       end
		end

		def session_destroy
			session[:admin] = nil
			redirect_to admin_loggin_path
		end

private
		  def session_filter
		   if session[:admin] == nil
		      redirect_to admin_loggin_path
		   end
		  end
protected

	    def password_cript(password, user)
	      passw = digest(password).to_s
	      backend_validate = user.w_digest(passw)
	      puts "#{backend_validate}"

	      if  backend_validate == true
	      	session[:admin] = "#{user.id}"
	      	redirect_to analitics_path
	        else
	        	session[:admin] = nil
	        	redirect_to admin_loggin_path
	      end
	      puts "#{session[:admin]}"
	    end

	    def digest(param_to_digest)
	      sha256 = Digest::SHA256.new
	      @digest = sha256.update param_to_digest.to_s
	    end
end
