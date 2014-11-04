class UsersController < ApplicationController
  before_action :signed_in_user, except: [:new, :create, :account_confirmation]
  before_action :not_signed_in_user, only: [:new, :create, :account_confirmation]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end
  
  def account_confirmation
    @user = User.find_by_password_reset_token(params[:token])
    if(@user)
      @user.update_column(:email_confirmed, true)
      @user.update_column(:password_reset_token, nil)
      redirect_to signin_path, notice: "E-mail confirmado com sucesso!"
    else
      redirect_to signin_path, notice: "Email não pode ser confirmado."
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        @user.send_confirmation
        flash[:info] = "Novo chief criado."
        format.html { redirect_to root_path }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :avatar, :email, :password, :password_confirmation, :birth, :gender_id)
    end

    def signed_in_user
      redirect_to signin_path unless signed_in?
    end
    
    def not_signed_in_user
      redirect_to home_index_path if signed_in?
    end
    
end