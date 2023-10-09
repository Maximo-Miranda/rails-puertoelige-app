require "test_helper"

class ResponseQuestionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get response_question_index_url
    assert_response :success
  end

  test "should get create" do
    get response_question_create_url
    assert_response :success
  end
end
