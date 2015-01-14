json.array!(@profiles) do |prof|
  json.merge! prof.attributes

  json.user prof.user, :id, :username, :email, :gender, :country, :searchable, :orientation, :zip_code
end
