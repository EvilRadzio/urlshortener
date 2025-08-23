json.extract! shortened_url, :id, :original_url, :short_url, :user_id, :created_at, :updated_at
json.url shortened_url_url(shortened_url, format: :json)
