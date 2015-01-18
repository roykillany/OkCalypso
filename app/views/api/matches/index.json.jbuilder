json.array!(@matches) do |match|
  json.merge! match.attributes

  json.matcher do
    json.(match.matcher, :id, :username, :email, :gender, :country, :searchable, :orientation, :zip_code, :avatar)
    json.image_url asset_path(match.matcher.avatar.url)
  end
  json.matchee do
    json.(match.matchee, :id, :username, :email, :gender, :country, :searchable, :orientation, :zip_code, :avatar)
    json.image_url asset_path(match.matchee.avatar.url)
  end
end
