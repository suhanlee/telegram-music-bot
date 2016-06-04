json.array!(@fowards) do |foward|
  json.extract! foward, :id, :chat_id, :first_name, :last_name
  json.url foward_url(foward, format: :json)
end
