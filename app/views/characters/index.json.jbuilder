json.array!(@characters) do |character|
  json.extract! character, :name, :level
  json.url character_url(character, format: :json)
end
