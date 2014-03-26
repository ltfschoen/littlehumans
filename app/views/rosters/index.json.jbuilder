json.array!(@rosters) do |roster|
  json.extract! roster, :id, :name_shift, :name_hospital, :name_location, :time_shift_start, :time_shift_end, :time_shift_duration
  json.url roster_url(roster, format: :json)
end
