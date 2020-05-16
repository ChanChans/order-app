class ApplicationController < ActionController::Base

  def authenticate!
    if admin_signed_in?
      authenticate_admin!
    else
      authenticate_user!
    end
  end
end
