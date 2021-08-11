class SessionsController < ApplicationController
  skip_before_action :sign_in?, if: -> { current_user.nil? }
  def new
    redirect_to users_path if current_user
  end

  def create
   user = User.find_by(email: params[:email].downcase)
    if user.present? && user.authenticate(params[:password])
      if user.activated
        log_in (user)
        params[:remember] == "on" ? remember(user) : forget(user)
        redirect_to users_path
      else
        message =  t"controllers.session.activated"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = t "controllers.session.invalid_email_password_combination"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to "/login"
  end

end
