# frozen_string_literal: true

API_KEY = Rails.application.credentials.dig(:flickr, :api_key)
API_SECRET = Rails.application.credentials.dig(:flickr, :api_secret)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :flickr, API_KEY, API_SECRET, scope: 'read'
end
