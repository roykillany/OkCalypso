json.array!(@matches) do |match|
  json.merge! match.attributes

  json.current_user_liked current_user.likes.pluck("likee_id").include?(match.matchee_id)
  if current_user.likes.pluck("likee_id").include?(match.matchee_id)
    json.like_id current_user.likes.find_by({likee_id: match.matchee_id, liker_id: current_user.id}).id
  end

  json.matcher do
    json.(match.matcher, :id, :username, :email, :gender, :country, :searchable, :orientation, :zip_code, :avatar)
    json.image_url asset_path(match.matcher.avatar.url)
  end
  json.matchee do
    json.(match.matchee, :id, :username, :email, :gender, :country, :searchable, :orientation, :zip_code, :avatar)
    json.image_url asset_path(match.matchee.avatar.url)
  end
end
