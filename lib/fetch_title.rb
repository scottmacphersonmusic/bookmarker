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
    page = Page.get(url)
    page.css('title').text.lstrip.rstrip
  end
end
