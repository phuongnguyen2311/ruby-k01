class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :sign_in?
  WillPaginate.per_page = 10
end
