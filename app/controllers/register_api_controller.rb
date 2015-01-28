class RegisterApiController < ApplicationController
 skip_before_filter :verify_authenticity_token  
   def create_user
       # http://localhost:3000/create_user?email=alfredo@cursa.me&role=admin&network_name=Demo&type_network=free&token_secure=938592hhhf4hui23ui2bfbu5i5y
   	 if filter_token
	   	 @user = User.create(email: params[:email], role: params[:role] , network_name: params[:network_name], type_network: params[:type_network], subdomain: params[:subdomain])
	   	 if @user.save 
	   	 	@notice = 'Usuario creado correctamente'
            session[:type] = 'user'
            session[:identifier] = @user.id
            session[:type_user] = @user.role
	   	 else
	   	 	@notice = 'El usuario no ha podido ser creado'
	   	 end
   	  else
   	  @notice = 'El token con el que estas intentando ingresar es incorrecto'
   	 end
   	 render json: @notice.to_json
   end

   def user_implemented
      # http://localhost:3000/user_implemented?email=alfredo@cursa.me&token_secure=938592hhhf4hui23ui2bfbu5i5y
      @user = User.find_by_email(params[:email])
       if @user.finish_training 
         @notice = true
       else
         @notice = false
         session[:type] = ''
         session[:identifier] = ''
         session[:type_user] = ''
         session[:type] = 'user'
         session[:identifier] = @user.id
         session[:type_user] = @user.role
       end
       render json: @notice.to_json
   end

   def create_network
       # http://localhost:3000/create_network?name=version4&subdomain=version4&token_secure=938592hhhf4hui23ui2bfbu5i5y
   	 if filter_token
   	   @network = Network.create(network_name: params[:name], subdomain: params[:subdomain])
	   	 if @network.save 
	   	 	@notice = 'Red creada correctamente'
	   	 else
	   	 	@notice = 'La red no ha podido ser creada'
	   	 end
   	 else
   	 	@notice = 'El token con el que estas intentando ingresar es incorrecto'
   	 end
   	 render json: @notice.to_json
   end


   def register_session
      # http://localhost:3000/register_session?email=alfredo@cursa.me&token_secure=938592hhhf4hui23ui2bfbu5i5y

   	 if filter_token
   	   @sessionx = SessionRegister.create(email: params[:email])
	   	 if @sessionx.save 
	   	 	@notice = 'Session creada correctamente'
	   	 else
	   	 	@sessionx = 'La session no ha podido ser creada'
	   	 end
   	 else
   	 	@notice = 'El token con el que estas intentando ingresar es incorrecto'
   	 end
   	 render json: @notice.to_json
   end
private
   def filter_token
   	 if params[:token_secure] == '938592hhhf4hui23ui2bfbu5i5y'
   	 	true 
   	    else
   	    false
   	 end
   end
end
