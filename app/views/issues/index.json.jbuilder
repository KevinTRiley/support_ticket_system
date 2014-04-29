json.array!(@issues) do |issue|
  json.extract! issue, :id, :description, :created_at, :updated_at, :state, :urgency, :picture, :attachment, :email, :device_id, :platform_id, :category_id
  json.url issue_url(issue, format: :json)
end
