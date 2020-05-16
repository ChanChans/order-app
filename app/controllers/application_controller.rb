class ApplicationController < ActionController::Base

  def authenticate!
    if admin_signed_in?
      authenticate_admin!
    else
      authenticate_customer!
    end
  end
end
