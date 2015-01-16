json.array!(@likes) do |like|
  json.merge! like.attributes

  json.liker do
    json.(like.liker, :id, :username, :email, :gender, :country, :searchable, :orientation, :zip_code, :avatar)
    json.image_url asset_path(like.liker.avatar.url(:thumb))
  end
  json.likee do
    json.(like.likee, :id, :username, :email, :gender, :country, :searchable, :orientation, :zip_code, :avatar)
    json.image_url asset_path(like.likee.avatar.url(:thumb))
  end
end
