class SessionsController < ApplicationController
  def new
    @title = "ログイン"
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to '/top/index'
    else
      flash[:error] = 'Invalid email/password combination' # 誤りあり!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
