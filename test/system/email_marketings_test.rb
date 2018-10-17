require "application_system_test_case"

class EmailMarketingsTest < ApplicationSystemTestCase
  setup do
    @email_marketing = email_marketings(:one)
  end

  test "visiting the index" do
    visit email_marketings_url
    assert_selector "h1", text: "Email Marketings"
  end

  test "creating a Email marketing" do
    visit email_marketings_url
    click_on "New Email Marketing"

    fill_in "Email Body", with: @email_marketing.email_body
    fill_in "Email Subject", with: @email_marketing.email_subject
    fill_in "Reciver Email", with: @email_marketing.reciver_email
    fill_in "Sender Email", with: @email_marketing.sender_email
    fill_in "Sender Name", with: @email_marketing.sender_name
    click_on "Create Email marketing"

    assert_text "Email marketing was successfully created"
    click_on "Back"
  end

  test "updating a Email marketing" do
    visit email_marketings_url
    click_on "Edit", match: :first

    fill_in "Email Body", with: @email_marketing.email_body
    fill_in "Email Subject", with: @email_marketing.email_subject
    fill_in "Reciver Email", with: @email_marketing.reciver_email
    fill_in "Sender Email", with: @email_marketing.sender_email
    fill_in "Sender Name", with: @email_marketing.sender_name
    click_on "Update Email marketing"

    assert_text "Email marketing was successfully updated"
    click_on "Back"
  end

  test "destroying a Email marketing" do
    visit email_marketings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Email marketing was successfully destroyed"
  end
end
