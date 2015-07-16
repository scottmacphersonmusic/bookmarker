module FetchTitle
  require 'nokogiri'

  class HtmlParserIncluded < HTTParty::Parser
    def html
      Nokogiri::HTML(body)
    end
  end

  class Page
    include HTTParty
    parser HtmlParserIncluded
  end

  def fetch_title(url)
    begin
      page = Page.get(url)
    rescue
      return "Invalid URL"
    else
      page.css('title').text.lstrip.rstrip
    end
  end
end
