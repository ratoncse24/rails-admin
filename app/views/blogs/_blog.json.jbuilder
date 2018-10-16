json.extract! blog, :id, :title, :short_description, :long_description, :status, :created_at, :updated_at
json.url blog_url(blog, format: :json)
