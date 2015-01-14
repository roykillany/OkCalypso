json.(@profile, :id, :user_id, :self_sum, :life_sum, :skills, :favorites, :needs, :thoughts, :fun_acts, :msg_reason)

json.user do
  json.(@profile.user, :id, :username, :email, :gender, :country, :searchable, :orientation, :zip_code)
end
