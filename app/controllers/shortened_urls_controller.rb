class ShortenedUrlsController < ApplicationController
  before_action :authenticate

  protect_from_forgery with: :null_session

  def index
    @shortened_urls = current_user.shortened_urls
  end

  def create
    url = current_user.shortened_urls.create!(original_url: params[:url])
    render json: { 
      short_code: url.short_url, 
      full: redirect_url(url.short_url) 
    }

  end

  def destroy
    url = current_user.shortened_urls.find(params[:id])
    url.destroy!
    head :no_content
  end
end
