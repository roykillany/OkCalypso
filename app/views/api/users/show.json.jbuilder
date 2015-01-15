json.(@user, :id, :username, :email, :gender, :searchable, :orientation, :country, :zip_code, :avatar)

json.profile do
  json.merge! @user.profile
end

json.preferences do
  json.merge! @user.preferences
end

json.likes do
  json.merge! @user.likes
end

json.user_answers do
  json.merge! @user.user_answers
end

json.matches do
  json.merge! @user.matches
end

json.sent_messages do
  json.merge! @user.sent_messages
end

json.received_messages do
  json.merge! @user.received_messages
end
