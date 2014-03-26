json.array!(@deliveries) do |delivery|
  json.extract! delivery, :id, :name_baby, :time_born, :name_location_born
  json.url delivery_url(delivery, format: :json)
end
