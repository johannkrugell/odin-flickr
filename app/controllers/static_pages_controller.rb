# frozen_string_literal: true

class StaticPagesController < ApplicationController
  require 'flickr'

  def home
    flickr = Flickr.new api_key, api_secret
    if params[:flickr_username]
      begin
        @photos = flickr.people.getPublicPhotos(:user_id => params[:flickr_username], :api_key => api_key)
      rescue Flickr::FailedResponse
        flash[:alert] = 'User not found'
        @photos = flickr.photos.getRecent(:api_key => api_key, :per_page => 48)
      end
    else
      @photos = flickr.photos.getRecent(:api_key => api_key, :per_page => 48)
    end
  end

  private

  def api_key
    Rails.application.credentials.dig(:flickr, :api_key)
  end

  def api_secret
    Rails.application.credentials.dig(:flickr, :api_secret)
  end
end
