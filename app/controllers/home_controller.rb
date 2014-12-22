class HomeController < ApplicationController
before_filter :session_in
  def index

  end

  def newsletter
  end
private
  def session_in
  	if session[:type] != nil
  		if session[:type] == 'network'
  			redirect_to institution_path
  		   else
  		   if session[:type_user] != nil
  		      redirect_to "/trainer/#{session[:type_user]}"
  		   end
  		end
  	end
  end
end
