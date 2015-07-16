class AutotitleController < ApplicationController
  respond_to :json

  def create
    render json: { url: params[:url] }
  end
end
