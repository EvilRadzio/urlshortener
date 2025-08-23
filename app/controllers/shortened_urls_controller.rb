class ShortenedUrlsController < ApplicationController
  before_action :authenticate

  def create
    url = current_user.shortened_url.create!(original_url: params[:url])
    render json: { short_code: url.short_url, full: short_url(url.short_url) }
  end

  def destroy
    url = current_user.shortened_urls.find(params[:id])
    url.destroy!
    head :no_content
  end
end
