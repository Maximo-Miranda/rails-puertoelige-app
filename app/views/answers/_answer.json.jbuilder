json.extract! answer, :id, :answer, :description, :type, :status, :question_id, :created_at, :updated_at
json.url answer_url(answer, format: :json)
