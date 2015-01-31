module Faker
  class Messages < Base
    flexible :messages

    class << self
      def reply
        fetch("messages.reply")
      end

      def request
        fetch("messages.request")
      end
    end
  end
end
