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

    def valid?
      page.present?
    end

    def title
      page.css('title').text.lstrip.rstrip
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
  end
end

# what does this module do and what could it be expected to be extended to do?
  # make a request to a given URL and retrieve HTML
  # parse that markup to return the text within the title element
# what functionality will be useful to abstract?
  # valid? method - see if a page is present (returned from the request)
  # page method - memoize page (in case further requests are desired)
    # use begin/rescue logic for errors in requesting an invalid url


# don't forget to use the Mocha gem to stub HTTP requests in testing!!!
