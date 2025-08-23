class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  protect_from_forgery with: :null_session

  include ActionController::HttpAuthentication::Token::ControllerMethods

  private

  def current_user
    @current_user
  end

  def authenticate
    authenticate_with_http_token do |token, _opts|
      @current_user = User.find_by(api_key: token)
    end
    render json: { error: "Nuh uh" }, status: :unauthorized unless @current_user
  end
end
