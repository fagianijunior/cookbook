class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    respond_to do |format|
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        format.html { redirect_to home_index_path }
      else
        flash.now[:danger] = "<h4>Ops!</h4>Email ou senha inválido."
        format.html {render :new}
      end
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "Usuario desconectado com sucesso!"
    redirect_to root_url
  end 
end
