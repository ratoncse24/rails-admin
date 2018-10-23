require "application_system_test_case"

class Admin::OrdersTest < ApplicationSystemTestCase
  setup do
    @admin_order = admin_orders(:one)
  end

  test "visiting the index" do
    visit admin_orders_url
    assert_selector "h1", text: "Admin/Orders"
  end

  test "creating a Order" do
    visit admin_orders_url
    click_on "New Admin/Order"

    fill_in "Customer", with: @admin_order.customer_id
    fill_in "Order Giftcard", with: @admin_order.order_giftcard
    fill_in "Order Number", with: @admin_order.order_number
    fill_in "Order Payment Type", with: @admin_order.order_payment_type
    fill_in "Order Pricetotal", with: @admin_order.order_pricetotal
    fill_in "Order Status", with: @admin_order.order_status
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit admin_orders_url
    click_on "Edit", match: :first

    fill_in "Customer", with: @admin_order.customer_id
    fill_in "Order Giftcard", with: @admin_order.order_giftcard
    fill_in "Order Number", with: @admin_order.order_number
    fill_in "Order Payment Type", with: @admin_order.order_payment_type
    fill_in "Order Pricetotal", with: @admin_order.order_pricetotal
    fill_in "Order Status", with: @admin_order.order_status
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit admin_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
