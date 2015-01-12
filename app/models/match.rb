class Match < ActiveRecord::Base
  validates_uniqueness_of :matcher_id, scope: [:matcher_id, :matchee_id]

  belongs_to(
    :matcher,
    class_name: "User",
    foreign_key: :matcher_id,
    primary_key: :id
  )
end
