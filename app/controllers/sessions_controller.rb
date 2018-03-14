class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:name] && params[:name] != ""
      session[:name] = params[:name]
      redirect_to root
    else
      redirect_to sessions_new 
    end
  end

  def destroy
  end

end
