module Domain
  module CommandHandlers
    class UpdateBookGeneralInfo
      include CommandHandler

      def call(command)
        with_aggregate(command.aggregate_id) do |book|
          book.update(command.uuid, command.title, command.author, command.published_date)
        end
      end

      def aggregate_class
        Domain::Book
      end
    end
  end
end
