class UserAnswer < ActiveRecord::Base
  belongs_to(
    :answerer,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to(
    :question,
    class_name: "Question",
    foreign_key: :question_id,
    primary_key: :id
  )

  belongs_to(
    :answer,
    class_name: "Answer",
    foreign_key: :answer_id,
    primary_key: :id
  )
end
