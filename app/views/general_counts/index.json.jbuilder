json.array!(@general_counts) do |general_count|
  json.extract! general_count, :id
  json.url general_count_url(general_count, format: :json)
end
