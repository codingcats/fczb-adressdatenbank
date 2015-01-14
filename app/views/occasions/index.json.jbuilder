json.array!(@occasions) do |occasion|
  json.extract! occasion, :id, :name
  json.url occasion_url(occasion, format: :json)
end
