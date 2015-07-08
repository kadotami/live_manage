module Admin
  module Auth
    def auth
      if !current_user.role_flag
        redirect_to '/'
      end
    end
  end
end