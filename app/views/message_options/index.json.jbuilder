json.array!(@message_options) do |message_option|
  json.extract! message_option, :id, :message_id, :options_id
  json.url message_option_url(message_option, format: :json)
end
