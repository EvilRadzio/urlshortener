class RedirectsController < ActionController::Base
  def show
    url = ShortenedUrl.find_by!(short_url: params[:short_url])
    redirect_to url.original_url, allow_other_host: true
  rescue ActiveRecord::RecordNotFound
    render plain: "Brak", status: :not_found
  end
end
