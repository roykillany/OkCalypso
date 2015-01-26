json.array!(@messages) do |msg|
  json.merge! msg.attributes

  json.sender do
    json.(msg.sender, :id, :username, :email, :gender, :country, :searchable, :orientation, :zip_code, :avatar)
    json.image_url asset_path(msg.sender.avatar.url)
  end
  json.receiver do
    json.(msg.receiver, :id, :username, :email, :gender, :country, :searchable, :orientation, :zip_code, :avatar)
    json.image_url asset_path(msg.receiver.avatar.url)
  end
end
