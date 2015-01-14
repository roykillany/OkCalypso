json.array!(@matches) do |match|
  json.merge! match.attributes

  json.matcher match.matcher, :id, :username, :email, :gender, :country, :searchable, :orientation, :zip_code
end
