class ApplicationController < ActionController::Base
  before_action :basic_auth,if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday])
    end
    
    # Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]

  private
    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == Rails.application.credentials.basic[:user] &&
        password == Rails.application.credentials.basic[:pass]
      end
    end

    def production?
      Rails.env.production?
    end
end
