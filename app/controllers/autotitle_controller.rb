class AutotitleController < ApplicationController
  respond_to :json

  def create
    title = PageParser::LinkInfo.new(params[:url]).title
    unless title.nil?
      render json: { title: title }
    else
      render json: { error: "Error: Unable to find title of given URL" }
    end
  end
end
