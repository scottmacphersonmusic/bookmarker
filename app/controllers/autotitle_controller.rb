class AutotitleController < ApplicationController
  include FetchTitle
  respond_to :json

  def create
    title = fetch_title(params[:url])
    render json: { title: title }
  end
end
