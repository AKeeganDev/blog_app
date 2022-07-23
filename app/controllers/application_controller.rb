class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  def print_current_user
    p current_user
  end

  def token(user_id)
    payload = { user_id: }
    JWT.encode(payload, hmac_secret, 'HS256')
  end

  def hmac_secret
    ENV.fetch('API_SECRET_KEY', nil)
  end

  def client_has_valid_token?
    !!current_user_id
  end

  def current_user_id
    begin
      token = request.headers['Authorization']
      decoded_array = JWT.decode(token.split[1], hmac_secret, true, { algorithm: 'HS256' })
      payload = decoded_array.first
    rescue StandardError # JWT::VerificationError
      return nil
    end
    payload['user_id']
  end

  def require_login
    render json: { error: 'Unauthorized' }, status: :unauthorized unless client_has_valid_token?
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end

  def authenticate_user!
    if user_signed_in?
      super

    else
      redirect_to new_user_session_path, notice: 'Please sign in'
    end
  end
end
