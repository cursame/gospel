# encoding: utf-8
class TrainerController < ApplicationController
  before_filter :trainer_filter, only: [:network, :admin, :teacher, :student]
  def follow_user
    respond_to do |format|
      format.js
    end
  end

  def follow_network
    respond_to do |format|
      format.js
    end
  end

  def network
    @user = Network.find(session[:identifier])
    @steap = @user.steap
    @total_steaps = 6
    @prev_steap = @steap.to_i - 1
    @to_steap = @steap.to_i + 1

    if @prev_steap == 0
      @preview_validate = false
    else
      @preview_validate = true
    end

    if @to_steap > @total_steaps.to_i
      @to_validate = false
    else
      @to_validate = true
    end 
  end

  def admin
    @user = User.find(session[:identifier])
    @steap = @user.steap
    @total_steaps = 7
    @prev_steap = @steap.to_i - 1
    @to_steap = @steap.to_i + 1

    if @prev_steap == 0
      @preview_validate = false
    else
      @preview_validate = true
    end

    if @to_steap > @total_steaps.to_i
      @to_validate = false
    else
      @to_validate = true
    end    


  end

  def teacher
    @user = User.find(session[:identifier])
    @steap = @user.steap
    @total_steaps = 8
    @prev_steap = @steap.to_i - 1
    @to_steap = @steap.to_i + 1

    if @prev_steap == 0
      @preview_validate = false
    else
      @preview_validate = true
    end

    if @to_steap > @total_steaps.to_i
      @to_validate = false
    else
      @to_validate = true
    end   
  end

  def student
    @user = User.find(session[:identifier])
    @steap = @user.steap
    @total_steaps = 8
    @prev_steap = @steap.to_i - 1
    @to_steap = @steap.to_i + 1

    if @prev_steap == 0
      @preview_validate = false
    else
      @preview_validate = true
    end

    if @to_steap > @total_steaps.to_i
      @to_validate = false
    else
      @to_validate = true
    end    
  end

  def update_steap
    if session[:type] == 'user'
    @user = User.find(session[:identifier])
    else
    @user = Network.find(session[:identifier])
    @network = true
    end
    @steap = params[:steap]
    @total_steaps = params[:total_steaps]

    if @network

     @user.update_attributes(steap:  @steap.to_i)
     if @user.steap.to_i == @total_steaps.to_i
       @user.update_attributes(finish_training: true)
     end

    else
      @user.steap = @steap.to_i
      if @user.steap.to_i == @total_steaps.to_i
         @user.finish_training = true
      end
      @user.save
    end
    
    @prev_steap = @steap.to_i - 1
    @to_steap = @steap.to_i + 1

    if @prev_steap == 0
      @preview_validate = false
    else
      @preview_validate = true
    end

    if @to_steap > @total_steaps.to_i
      @to_validate = false
    else
      @to_validate = true
    end    

    respond_to do |format|
      format.js
    end  
  end
  
  def preview_steap

    if session[:type] == 'user'
    @user = User.find(session[:identifier])
    else
    @user = Network.find(session[:identifier])
    end

    @steap = params[:steap]
    @total_steaps = params[:total_steaps]

    @prev_steap = @steap.to_i - 1
    @to_steap = @steap.to_i + 1

    if @prev_steap == 0
      @preview_validate = false
    else
      @preview_validate = true
    end

    if @to_steap > @total_steaps.to_i
      @to_validate = false
    else
      @to_validate = true
    end    

    respond_to do |format|
      format.js
    end  
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
