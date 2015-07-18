class AutotitleController < ApplicationController
  respond_to :json

  def create
    title = PageParser::LinkInfo.new(params[:url]).title
    render json: { title: title }
  end
end
