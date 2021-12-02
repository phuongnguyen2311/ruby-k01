class SessionsController < ApplicationController
  def new
  end

  def create
    user =User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      log_in user
      redirect_to users_path
    else
      flash.now[:danger] = t "invalid_email_password_combination"
      render :new
    end
  end
  def destroy
    log_out
    redirect_to "/login"
  end

end
