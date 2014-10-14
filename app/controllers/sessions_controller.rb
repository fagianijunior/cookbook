class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:sucess] = "Usuario logado com sucesso"
      redirect_to user
    else
      flash.now[:warning] = "Nome de usuario ou senha invalidos"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "Usuario desconectado!"
    redirect_to root_url
  end 
end
