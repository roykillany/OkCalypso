class Match < ActiveRecord::Base
  belongs_to(
    :matcher,
    class_name: "User",
    foreign_key: :matcher_id,
    primary_key: :id
  )
end
