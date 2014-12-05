class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to current_user
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.email_confirmed?
        log_in user
        redirect_to current_user
      else
        flash.now[:danger] = 'Email não confirmado,<br />Verifique seu e-mail.'
        redirect_to login_path
      end
    else
      flash.now[:danger] = "<h4>Ops!</h4>Email ou senha inválido."
      redirect_to login_path
    end
  end

  def destroy
    log_out
    flash[:info] = "Chief desconectado com sucesso!"
    redirect_to root_path
  end 
end