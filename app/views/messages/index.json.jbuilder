json.array!(@messages) do |message|
  json.extract! message, :msg_id, :user_message, :transform_pattern
end