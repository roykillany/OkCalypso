class Like < ActiveRecord::Base
  belongs_to(
    :liker,
    class_name: "User",
    foreign_key: :liker_id,
    primary_key: :id
  )

  has_many(
    :likees,
    class_name: "User",
    foreign_key: :id,
    primary_key: :likee_id
  )
end
