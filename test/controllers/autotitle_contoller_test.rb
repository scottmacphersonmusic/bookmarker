require 'test_helper'

class AutotitleControllerTest < ActionController::TestCase
  test "create returns title if available" do
    PageParser::LinkInfo.any_instance.stubs(:title).returns("valid title")
    get :create, format: :json
    parsed_body = JSON.parse(response.body)
    assert_equal "valid title", parsed_body["title"]
  end

  test "create returns error message if title not available" do
    PageParser::LinkInfo.any_instance.stubs(:title).returns(nil)
    get :create, format: :json
    parsed_body = JSON.parse(response.body)
    assert_equal "Error: Unable to find title of given URL", parsed_body["error"]
  end
end
