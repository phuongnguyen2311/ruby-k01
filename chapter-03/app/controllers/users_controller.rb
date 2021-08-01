class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :set_user, only: %i[edit update destroy update_user]
  skip_before_action :sign_in?, only: %i[new create]
  # GET /users or /users.json
  
  def index
    # @users = User.all
    @email = params[:email]
    @users =  @email.present? ? User.where(email: @email) : User.all
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
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :gender, :password , :password_confirmation)
    end
end
# id, name, email, phone, age, created_at, updated_at, date_of_birth, gender, year, school
