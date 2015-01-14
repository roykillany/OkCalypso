json.array!(@messages) do |msg|
  json.merge! msg.attributes

  json.sender msg.sender, :id, :username, :email, :gender, :country, :searchable, :orientation, :zip_code
  json.receiver msg.receiver, :id, :username, :email, :gender, :country, :searchable, :orientation, :zip_code
end
