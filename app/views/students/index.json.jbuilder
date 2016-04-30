json.array!(@students) do |student|
  json.extract! student, :id, :first_name, :middle_name, :last_name, :batch_id
  json.url student_url(student, format: :json)
end
