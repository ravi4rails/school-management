json.array!(@batches) do |batch|
  json.extract! batch, :id, :start_year, :end_year, :is_active, :course_id
  json.url batch_url(batch, format: :json)
end
