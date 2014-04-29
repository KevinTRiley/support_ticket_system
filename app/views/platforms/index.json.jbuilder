json.array!(@platforms) do |platform|
  json.extract! platform, :id, :name, :created_at, :updated_at
  json.url platform_url(platform, format: :json)
end
