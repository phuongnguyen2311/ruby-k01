class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :set_user, only: %i[edit update destroy update_user]
  skip_before_action :sign_in?, only: %i[new create]
  before_action :correct_user, only: [:edit, :update]
  # GET /users or /users.json
  
  def index
    # @users = User.all
    @email = params[:email]
    @users =  @email.present? ? User.where(email: @email) : User.all.paginate(page: params[:page])
  end
  
  # GET /users/1 or /users/1.json
  def show
    @user =  User.includes(:microposts).find_by(id: params[:id])
  end
  
  def contacts
    @user = User.find_by id: session[:user_id]
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find_by(id: params[:id])
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params) # Not the final implementation!
      if @user.save
         flash[:success] = t "register_sucsess"
         redirect_to "/login"
      else
       render :new
      end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user = User.find_by(id: params[:id])
    if @user.update user_params
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render "edit"
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    user = User.find_by(id: params[:id])
    if user&.destroy
      flash[:success] = "User deleted"
    else
      flash[:danger] = "Delete fail!"
    end
      redirect_to "/users"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :phone, :gender, :date_of_birth,  :age, :password , :password_confirmation, :year, :school)
    end
     
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
# id, name, email, phone, age, created_at, updated_at, date_of_birth, gender, year, school
