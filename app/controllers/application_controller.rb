class ApplicationController < ActionController::Base

  before_action :logout

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include ApplicationHelper

#例外処理
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from Exception, with: :render_500


  def render_404(exception = nil)
    if exception
      logger.info "Rendering 404 with exception: #{exception.message}"
    end

    render :template => "errors/404", :status => 404, :layout => 'application', :content_type => 'text/html'
  end

  def render_500(exception = nil)
    if exception
      logger.info "Rendering 500 with exception: #{exception.message}"
    end

    render :template => "errors/500", :status => 500, :layout => 'application'
  end

  private
    def logout
      unless signed_in? or params[:controller] == 'sessions' or (params[:controller] == 'users' and (params[:action] == 'new' or params[:action] == 'create'))
        redirect_to '/login'
      end
    end
end
