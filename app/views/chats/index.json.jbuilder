json.array!(@chats) do |chat|
  json.extract! chat, :id, :chat_id, :from_id, :first_name, :last_name, :text
  json.url chat_url(chat, format: :json)
end
