class Answer < ActiveRecord::Base
  belongs_to(
    :question,
    class_name: "Question",
    foreign_key: :question_id,
    primary_key: :id
  )

  has_many(
    :user_answers,
    class_name: "UserANswer",
    foreign_key: :answer_id,
    primary_key: :id
  )
end
