json.array!(@poll_recs) do |poll_rec|
  json.extract! poll_rec, :id
  json.url poll_rec_url(poll_rec, format: :json)
end
