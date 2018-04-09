json.extract! post, :id, :title, :details, :department_id, :user_id, :post_type, :created_at, :updated_at
json.url post_url(post, format: :json)
