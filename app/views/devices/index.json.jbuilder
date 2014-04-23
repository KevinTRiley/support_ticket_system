json.array!(@devices) do |device|
  json.extract! device, :id, :name, :issue
  json.url device_url(device, format: :json)
end
