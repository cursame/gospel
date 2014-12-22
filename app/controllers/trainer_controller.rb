class TrainerController < ApplicationController
  before_filter :trainer_filter, only: [:network, :admin, :teacher, :student]
  def follow_user
  end

  def follow_network
  end

  def network
  end

  def admin
  end

  def teacher
  end

  def student
  end

  def follow
     @user = User.find_by_email(params[:code])
     if @user.nil?
       @network = Network.find_by_token_network(params[:code])
        if  !@network.nil?
          session[:type] = 'network'
          session[:identifier] = @network.id
          flash[:notice] = 'Se ha cargado el módulo de implementación'
          redirect_to institution_path

          else
          flash[:notice] = 'No ha sido posible cargar el módulo de implementación'
          redirect_to :back
        end
     else
        session[:type] = 'user'
        session[:identifier] = @user.id
        session[:type_user] = @user.role
        flash[:notice] = 'Se ha cargado el módulo de implementación'
        redirect_to "/trainer/#{@user.role}"
     end
  end

  def unfollow
    session[:type] = nil
    session[:identifier] = nil
    session[:type_user] = nil
    flash[:notice] = 'Gracias por usar el módulo de implementación de Cúrsame'
    redirect_to root_path
  end

private
  def trainer_filter
    if session[:identifier] == nil
    flash[:notice] = 'Es necesario que ingreses con tu cuenta para poder ver los contenidos'
    redirect_to root_path
    end
  end
end
