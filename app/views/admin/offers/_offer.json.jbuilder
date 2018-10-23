json.extract! offer, :id, :offer_name, :offer_code, :offer_value, :minimum_value, :status, :start_date, :end_date, :customer_id, :created_at, :updated_at
json.url offer_url(offer, format: :json)
