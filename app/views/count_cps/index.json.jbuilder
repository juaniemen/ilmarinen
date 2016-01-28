json.array!(@count_cps) do |count_cp|
  json.extract! count_cp, :id
  json.url count_cp_url(count_cp, format: :json)
end
