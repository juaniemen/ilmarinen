json.array!(@counts) do |count|
  json.extract! count, :id
  json.url count_url(count, format: :json)
end
