json.extract! email_marketing, :id, :sender_name, :sender_email, :reciver_email, :email_subject, :email_body, :created_at, :updated_at
json.url email_marketing_url(email_marketing, format: :json)
