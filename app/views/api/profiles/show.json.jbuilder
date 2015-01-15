json.(@profile, :id, :user_id, :self_sum, :life_sum, :skills, :favorites, :needs, :thoughts, :fun_acts, :msg_reason, :avatar)
json.is_current_user @profile.user_id == current_user.id
json.current_user_liked current_user.likes.pluck("likee_id").include?(@profile.user_id)
json.user @profile.user, :id, :username, :email, :gender, :country, :searchable, :orientation, :zip_code, :avatar
