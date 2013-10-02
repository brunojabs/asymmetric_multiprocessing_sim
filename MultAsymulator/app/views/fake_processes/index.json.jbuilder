json.array!(@fake_processes) do |fake_process|
  json.extract! fake_process, :name, :done
  json.url fake_process_url(fake_process, format: :json)
end
