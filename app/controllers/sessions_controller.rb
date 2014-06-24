class SessionsController < ApplicationController
  def new
    @title = "ログイン"
    if signed_in?
      redirect_to '/top/index'
    end
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to '/top/index'
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
