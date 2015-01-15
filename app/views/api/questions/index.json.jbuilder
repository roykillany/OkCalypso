json.array!(@questions) do |q|
  json.merge! q.attributes

  json.answers q.answers.each do |a|
    json.merge! a.attributes
    json.answered current_user.user_answers.pluck(:answer_id).include?(a.id)
  end
end
