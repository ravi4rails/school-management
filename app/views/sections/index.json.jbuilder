json.array!(@sections) do |section|
  json.extract! section, :id, :name, :course_id
  json.url section_url(section, format: :json)
end
