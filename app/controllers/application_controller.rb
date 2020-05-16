class ApplicationController < ActionController::Base


  protected

    # ログイン時のパスを変更してる
    def after_sign_in_path_for(resource)
      if customer_signed_in?
        customers_path(resource)
      else
        admin_top_path
      end
    end

    #ログアウト時のパスの変更
    def after_sign_out_path_for(resource)
      root_path
    end

    # 新規登録の保存機能
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,
  			 keys: [:first_name, :last_name, :kana_first_name, :kana_last_name,
            :email, :postal_code, :residence, :phone_number])

      #sign_upの際にnameのデータ操作を許。追加したカラム。
  		devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
    end

  private

  
  def authenticate!
    if admin_signed_in?
      authenticate_admin!
    else
      authenticate_customer!
    end
  end

end
