json.extract! order, :id, :name, :enable, :created_at, :updated_at
json.url admin_order_url(order, format: :json)
