class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :sign_in?
end
