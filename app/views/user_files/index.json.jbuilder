json.array!(@user_files) do |user_file|
  json.extract! user_file, :name, :content_type, :data
  json.url user_file_url(user_file, format: :json)
end
