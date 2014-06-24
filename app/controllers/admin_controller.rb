class AdminController < ApplicationController
  include Admin::Auth
  before_action :auth
  layout "admin"
end
