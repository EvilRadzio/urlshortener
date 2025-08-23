class UsersController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods


  # sprawdzanie czy zalogowany z wyjatkiem tworzenia
  before_action :authenticate_with_api_key, except: :create
  skip_before_action :authenticate_with_api_key, only: :create

  # unprotected create
  def create
    user = User.create!(email: params[:email])
    render json: { id: user.id, email: user.email, api_key: user.api_key }
  end


  def update
    current_user.update!(email: params[:email])
    render json: { id: current_user.id, email: current_user.email }
  end

  # rotate api
  def rotate_api_key
    current_user.rotate_api_key!
    render json: { api_key: current_user.api_key }
  end

  # user delete
  def destroy
    current_user.destroy!
    head :no_content
  end

  private

  # Api auth
  def authenticate_with_api_key
    authenticate_or_request_with_http_token do |token, _options|
      @current_user = User.find_by(api_key: token)
    end
  end

  # current_user
  def current_user
    @current_user
  end
end
