class SessionsController < ApplicationController
  skip_before_action :sign_in
  skip_before_action :redirect_to_users , only: %i[destroy ]

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
    redirect_to login_path
  end
end
