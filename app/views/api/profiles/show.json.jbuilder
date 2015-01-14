json.(@profile, :id, :user_id, :self_sum, :life_sum, :skills, :favorites, :needs, :thoughts, :fun_acts, :msg_reason)
json.is_current_user @profile.user_id == current_user.id
json.user do
  json.merge! @profile.user.attributes
end
