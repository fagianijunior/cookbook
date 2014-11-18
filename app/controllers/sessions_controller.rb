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
        redirect_to user
      else
        flash.now[:danger] = 'Email não confirmado,<br />Verifique seu e-mail.'
        render :new
      end
    else
      flash.now[:danger] = "<h4>Ops!</h4>Email ou senha inválido."
      render :new
    end
  end

  def destroy
    log_out
    flash[:info] = "Chief desconectado com sucesso!"
    redirect_to root_path
  end 
end