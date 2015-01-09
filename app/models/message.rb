class Message < ActiveRecord::Base
  validates :sender_id, :receiver_id, :title, presence: true
end
