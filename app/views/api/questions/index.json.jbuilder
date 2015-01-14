json.array!(@questions) do |q|
  json.merge! q.attributes

  json.answers q.answers
end
