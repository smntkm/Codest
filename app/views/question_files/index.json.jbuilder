json.array!(@question_files) do |question_file|
  json.extract! question_file, :name, :content_type, :data
  json.url question_file_url(question_file, format: :json)
end
