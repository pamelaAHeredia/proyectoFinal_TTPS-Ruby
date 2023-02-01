require 'test_helper'

class LocalitiesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test 'render a list of localities' do
    get '/localities'

    assert_response :success
    assert_select '.locality', 2
  end
end
