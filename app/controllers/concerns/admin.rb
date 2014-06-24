module Admin
  module Auth
    def auth
      if !current_user.role_flag
        redirect_to '/top/index'
      end
    end
  end
end