json.array!(@user_events) do |event|
  json.id "#{event.id}"
  json.title "#{event.name}"
  json.start event.start_date
  json.end event.end_date
  json.url root_url(format: :html)
end