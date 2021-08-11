class AccountActivationsController < ApplicationController
  skip_before_action :sign_in?
  def edit
    user = User.find_by email: params[:email]
    if user && !user.activated && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = t"account.activated"
      redirect_to user
    else
      flash[:danger] = t"account.invalid"
      redirect_to root_url
    end
  end
end
