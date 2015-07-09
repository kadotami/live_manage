class SessionsController < ApplicationController
  def new
    @title = "login"
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      if user.role_flag
        redirect_to '/admin/'
      else
        redirect_to '/'
      end
    else
      redirect_to '/login'
    end
  end

  def destroy
    sign_out
    redirect_to '/login'
  end
end
