class PasswordResetsController < ApplicationController
  skip_before_action :sign_in?
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]
  
  def new
  end
  
  def create
    @user = User.find_by email: params[:password_reset][:email].downcase
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to "/login"
    else
      flash.now[:danger] = "Email address not found"
      render :new
    end
  end

  def edit
  end
  
  def update
    if user_params[:password].empty?
      flash[:danger] = "Password not empty"
      render :edit
    elsif @user.update user_params
      flash[:success] = "Password updated"
      redirect_to "/login"
    else
      flash.delete(:danger)
      render :edit
    end
  end

  private
  def get_user
    @user = User.find_by email: params[:email]
  end

  def valid_user
    return if (@user && @user.activated && @user.authenticated?(:reset, params[:id]))
    redirect_to "/login"
  end

  def check_expiration
    return unless @user.password_reset_expired?
    flash[:danger] = "Password reset has expired."
    redirect_to new_password_reset_url
  end

  def user_params
    params.require(:user).permit :password, :password_confirmation
  end
end
