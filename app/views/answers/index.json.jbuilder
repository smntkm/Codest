json.array!(@answers) do |answer|
  json.extract! answer, :user_name, :question_id, :answer_id, :email
  json.url answer_url(answer, format: :json)
end
