json.merge! @message.attributes

json.sender do
  json.(@message.sender, :id, :username, :email, :gender, :country, :searchable, :orientation, :zip_code, :avatar)
  json.image_url asset_path(@message.sender.avatar.url)
end
json.receiver do
  json.(@message.receiver, :id, :username, :email, :gender, :country, :searchable, :orientation, :zip_code, :avatar)
  json.image_url asset_path(@message.receiver.avatar.url)
end
