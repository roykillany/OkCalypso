json.array!(@likes) do |like|
  json.merge! like.attributes

  json.liker like.liker, :id, :username, :email, :gender, :country, :searchable, :orientation, :zip_code
  json.likee like.likee, :id, :username, :email, :gender, :country, :searchable, :orientation, :zip_code
end
