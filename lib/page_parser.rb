require 'nokogiri'

module PageParser
  class HtmlParserIncluded < HTTParty::Parser
    def html
      Nokogiri::HTML(body)
    end
  end

  class Page
    include HTTParty
    parser HtmlParserIncluded
  end

  class LinkInfo
    def initialize(url)
      @url = url
    end

    def title
      if valid?
        return page.css('title').text.lstrip.rstrip
      end
    end

    private

    def page
      return @page if @page

      begin
        @page = Page.get(@url)
      rescue
        return nil
      end
    end

    def valid?
      page.present?
    end
  end
end
