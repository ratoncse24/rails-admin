require 'test_helper'

class EmailMarketingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @email_marketing = email_marketings(:one)
  end

  test "should get index" do
    get email_marketings_url
    assert_response :success
  end

  test "should get new" do
    get new_email_marketing_url
    assert_response :success
  end

  test "should create email_marketing" do
    assert_difference('EmailMarketing.count') do
      post email_marketings_url, params: { email_marketing: { email_body: @email_marketing.email_body, email_subject: @email_marketing.email_subject, reciver_email: @email_marketing.reciver_email, sender_email: @email_marketing.sender_email, sender_name: @email_marketing.sender_name } }
    end

    assert_redirected_to email_marketing_url(EmailMarketing.last)
  end

  test "should show email_marketing" do
    get email_marketing_url(@email_marketing)
    assert_response :success
  end

  test "should get edit" do
    get edit_email_marketing_url(@email_marketing)
    assert_response :success
  end

  test "should update email_marketing" do
    patch email_marketing_url(@email_marketing), params: { email_marketing: { email_body: @email_marketing.email_body, email_subject: @email_marketing.email_subject, reciver_email: @email_marketing.reciver_email, sender_email: @email_marketing.sender_email, sender_name: @email_marketing.sender_name } }
    assert_redirected_to email_marketing_url(@email_marketing)
  end

  test "should destroy email_marketing" do
    assert_difference('EmailMarketing.count', -1) do
      delete email_marketing_url(@email_marketing)
    end

    assert_redirected_to email_marketings_url
  end
end
