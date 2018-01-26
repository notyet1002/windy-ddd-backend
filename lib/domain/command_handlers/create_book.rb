module Domain
  module CommandHandlers
    class CreateBook
      include CommandHandler

      def call(command)
        with_aggregate(command.aggregate_id) do |book|
          book.create(command.uuid, command.title, command.author, command.published_date)
        end
      end

      def aggregate_class
        Domain::Book
      end
    end
  end
end
