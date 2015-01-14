json.array!(@profiles) do |prof|
  json.merge! prof.attributes

  json.user prof.user
end
