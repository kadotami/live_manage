class SessionsController < ApplicationController
  def new
    @title = "login"
    if signed_in?
      redirect_to '/top/index'
    end
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      if user.role_flag
        redirect_to '/admin/'
      else
        redirect_to '/top/index'
      end
    else
      redirect_to '/'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
