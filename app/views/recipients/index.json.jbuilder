json.array!(@recipients) do |recipient|
  json.extract! recipient, :id, :name, :email, :created_at, :updated_at
  json.url recipient_url(recipient, format: :json)
end
