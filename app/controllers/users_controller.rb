class UsersController < ApplicationController
  def new
    @title = "sign up"
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if params[:user][:keyword] == YAML.load(File.open("config/setting.yml"))["keyword"]
      respond_to do |format|
        if @user.save
          sign_in @user
          format.html {redirect_to '/'}
        else
          return redirect_to '/signup'
        end
      end
    else
      return redirect_to '/signup'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
