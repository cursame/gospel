class RegisterApiController < ApplicationController
 skip_before_filter :verify_authenticity_token  
   def create_user
   	 if filter_token
	   	 @user = User.create(email: params[:email], role: params[:role] , network_name: params[:network_name], type_network: params[:type_network])
	   	 if @user.save 
	   	 	@notice = 'Usuario creado correctamente'
	   	 else
	   	 	@notice = 'El usuario no ha podido ser creado'
	   	 end
   	  else
   	  @notice = 'El token con el que estas intentando ingresar es incorrecto'
   	 end
   	 render json: @notice.to_json
   end

   def create_network

   	 if filter_token
   	   @network = Network.create(network_name: params[:name])
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
