json.(@profile, :id, :user_id, :self_sum, :life_sum, :skills, :favorites, :needs, :thoughts, :fun_acts, :msg_reason, :avatar)
json.is_current_user @profile.user_id == current_user.id
json.current_user_liked current_user.likes.pluck("likee_id").include?(@profile.user_id)
if current_user.likes.pluck("likee_id").include?(@profile.user_id)
  json.like_id current_user.likes.find_by({likee_id: @profile.user_id, liker_id: current_user.id}).id
end
json.user do
  json.merge! @profile.user.attributes
  json.image_url asset_path(@profile.user.avatar.url(:medium))
end
