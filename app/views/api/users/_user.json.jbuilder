json.(user, :id, :username, :email, :gender, :country, :searchable, :orientation, :zip_code, :avatar)
json.image_url asset_path(user.avatar.url(:thumb))
json._type "User"
