json.array!(@resolutions) do |resolution|
  json.extract! resolution, :id, :issue_id, :note, :email_message
  json.url resolution_url(resolution, format: :json)
end
