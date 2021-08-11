class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :sign_in?
  before_action :set_locale
  WillPaginate.per_page = 10
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  # app/controllers/application_controller.rb
  def default_url_options
    { locale: I18n.locale }
  end

end
