require "application_system_test_case"

class OffersTest < ApplicationSystemTestCase
  setup do
    @offer = offers(:one)
  end

  test "visiting the index" do
    visit offers_url
    assert_selector "h1", text: "Offers"
  end

  test "creating a Offer" do
    visit offers_url
    click_on "New Offer"

    fill_in "Customer", with: @offer.customer_id
    fill_in "End Date", with: @offer.end_date
    fill_in "Minimum Value", with: @offer.minimum_value
    fill_in "Offer Code", with: @offer.offer_code
    fill_in "Offer Name", with: @offer.offer_name
    fill_in "Offer Value", with: @offer.offer_value
    fill_in "Start Date", with: @offer.start_date
    fill_in "Status", with: @offer.status
    click_on "Create Offer"

    assert_text "Offer was successfully created"
    click_on "Back"
  end

  test "updating a Offer" do
    visit offers_url
    click_on "Edit", match: :first

    fill_in "Customer", with: @offer.customer_id
    fill_in "End Date", with: @offer.end_date
    fill_in "Minimum Value", with: @offer.minimum_value
    fill_in "Offer Code", with: @offer.offer_code
    fill_in "Offer Name", with: @offer.offer_name
    fill_in "Offer Value", with: @offer.offer_value
    fill_in "Start Date", with: @offer.start_date
    fill_in "Status", with: @offer.status
    click_on "Update Offer"

    assert_text "Offer was successfully updated"
    click_on "Back"
  end

  test "destroying a Offer" do
    visit offers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Offer was successfully destroyed"
  end
end
