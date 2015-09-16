json.array!(@howto_lists) do |howto_list|
  json.extract! howto_list, :id, :name, :author
  json.url howto_list_url(howto_list, format: :json)
end
