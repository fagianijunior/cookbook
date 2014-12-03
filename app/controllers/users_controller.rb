class UsersController < ApplicationController
  before_action :logged_in_user, only:    [:edit, :update, :index, :show]
  before_action :correct_user,   only:    [:edit, :update]
  before_action :set_user, only:          [:edit, :update, :show, :destroy]

  # GET /users
  # GET /users.json
  def index
    if params[:search].nil?
      @users = User.paginate(page: params[:page])
    else
      @users = User.where("lower(first_name) like ? or lower(last_name) like ?", "%#{params[:search][:q].downcase}%", "%#{params[:search][:q].downcase}%").paginate(page: params[:page])
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @post = Post.new
    #@posts = feed(current_user)
    #@posts = Post.order('created_at DESC').all 
  end
  
  # GET /users/new
  def new
    if logged_in?
      redirect_to current_user
    else
      @user = User.new
    end
  end

  # GET /users/1/edit
  def edit
  end
  
  def following
    @title = "Seguindo"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Me seguem"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def account_confirmation
    @user = User.find_by_password_reset_token(params[:token])
    if(@user)
      @user.update_column(:email_confirmed, true)
      @user.update_column(:password_reset_token, nil)
      flash.now[:seccess] = "<h4>E-mail confirmado com sucesso!</h4>Realize o login."
      redirect_to login_path
    else
      flash.now[:success] = "Email não pode ser confirmado."
      redirect_to login_path
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_confirmation
      flash.now[:success] = "<h4>Novo chief criado.</h4>Um email de confirmação foi enviado para: #{@user.email}."
      redirect_to root_path
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      flash[:success] = "Dados do chief atualizados com sucesso!"
      redirect_to @user
    else
      render :edit
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    flash[:success] = "Chief removido com sucesso!"
    redirect_to users_url
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

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Porfavor loge-se."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
end