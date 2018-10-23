json.extract! admin_order, :id, :order_number, :order_status, :order_pricetotal, :order_payment_type, :order_giftcard, :customer_id, :created_at, :updated_at
json.url admin_order_url(admin_order, format: :json)
